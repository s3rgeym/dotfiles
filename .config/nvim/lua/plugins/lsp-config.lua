---@diagnostic disable: missing-parameter
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    "b0o/schemastore.nvim",
  },
  config = function()
    -- Конфиги самих языковых серверов в ~/.config/nvim/after/lsp. Они рекуривно
    -- объединяются со встроенными.
    -- Полностью переопределить конфиги можно в ~/.config/nvim/lsp.
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "biome",
        "clangd",
        "cssls",
        "docker_compose_language_service",
        "docker_language_server",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "ruff",
        "stylua",
        "vimls",
        "vtsls",
        "vue_ls",
        "yamlls",
      },
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      "force",
      capabilities,
      require("blink.cmp").get_lsp_capabilities()
    )

    -- Настройки для всех серверов
    vim.lsp.config("*", {
      capabilities = capabilities,
      root_markers = { ".git" },
    })

    -- jsonls специфичные настройки
    vim.lsp.config("jsonls", {
      settings = {
        json = {
          -- Дополнение в json через схемы
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    -- Включаем сервера
    -- Включать нужно только сервера, установленные, минуя Mason
    vim.lsp.enable({
      -- Идет вместе с rust
      "rust_analyzer",
      -- Установлен через pnpm, так как через Mason при установке через pip
      -- ставится nodejs-wheel — prebuilt Node.js
      "basedpyright",
    })

    -- Настройка внешнего вида диагностики
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = {
        current_line = true,
        only_current_line = true,
      },
      underline = true,
      severity_sort = true,
      -- update_in_insert = true, -- Закомментируй, если будет мешать
    })

    local lsp_group =
      vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = lsp_group,
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local bufnr = args.buf

        local function bufmap(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, {
            buffer = bufnr,
            desc = "LSP: " .. desc,
            silent = true,
            noremap = true,
          })
        end

        bufmap("n", "K", vim.lsp.buf.hover, "Show Documentation")
        bufmap("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
        bufmap("n", "grn", vim.lsp.buf.rename, "Rename Symbol")
        bufmap("n", "gra", function()
          require("fzf-lua").lsp_code_actions()
        end, "Code Actions")
        bufmap("n", "grr", function()
          require("fzf-lua").lsp_references()
        end, "List References")
        bufmap("n", "gri", function()
          require("fzf-lua").lsp_implementations()
        end, "List Implementations")
        bufmap("n", "gO", function()
          require("fzf-lua").lsp_document_symbols()
        end, "Document Symbols")

        bufmap("n", "gd", function()
          require("fzf-lua").lsp_definitions()
        end, "Go to Definition")

        bufmap("n", "gD", function()
          require("fzf-lua").lsp_declarations()
        end, "Go to Declaration")

        bufmap("n", "grt", function()
          require("fzf-lua").lsp_typedefs()
        end, "Type Definition")

        bufmap("n", "gF", function()
          require("fzf-lua").lsp_finder()
        end, "Finder")

        bufmap("n", "gl", vim.diagnostic.open_float, "Line Diagnostics")
        bufmap("n", "[d", function()
          vim.diagnostic.jump({ count = -1 })
        end, "Prev Diagnostic")
        bufmap("n", "]d", function()
          vim.diagnostic.jump({ count = 1 })
        end, "Next Diagnostic")
        bufmap("n", "<leader>ld", function()
          require("fzf-lua").diagnostics_document()
        end, "Document Diagnostics")
        bufmap("n", "<leader>lD", function()
          require("fzf-lua").diagnostics_workspace()
        end, "Workspace Diagnostics")

        bufmap("n", "<leader>sw", function()
          require("fzf-lua").lsp_workspace_symbols()
        end, "Workspace Symbols")
        -- Одно и тоже по сути
        -- map("n", "<leader>sW", function()
        --   require("fzf-lua").lsp_live_workspace_symbols()
        -- end, "Live Workspace Symbols")

        -- Включаем Inlay Hints по умолчанию
        if client.supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true)

          bufmap("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(
              not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
            )
          end, "Switch Toggle")
        end

        -- Подсветка упоминаний символа под курсором
        if client.supports_method("textDocument/documentHighlight") then
          local highlight_group = vim.api.nvim_create_augroup(
            "lsp_document_highlight",
            { clear = false }
          )

          -- Очищаем старые команды только для ЭТОГО буфера перед созданием новых
          vim.api.nvim_clear_autocmds({
            group = highlight_group,
            buffer = bufnr,
          })

          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = highlight_group,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            group = highlight_group,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })
  end,
}
