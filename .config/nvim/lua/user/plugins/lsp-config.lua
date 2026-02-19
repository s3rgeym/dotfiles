---@diagnostic disable: missing-parameter, param-type-mismatch
-- Конфиги LSP, идущие вместе с плагином:
-- - ~/.local/share/nvim/lazy/nvim-lspconfig/lsp/

-- Пользовательские конфиги:
-- - ~/.config/nvim/lsp — для переопределения или заданиях новых.
-- - ~/.config/nvim/after/lsp — для расширения существующих.

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- opts передается для автоматического вызова setup
    { "mason-org/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    "b0o/schemastore.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function()
    -- Обзяательно должен вызываться первым
    require("mason-lspconfig").setup({
      -- Тут объявлены языковые сервера, которые нужно поставить через Mason
      -- Компиляторы лучше ставить системно
      ensure_installed = {
        "bashls",
        "biome",
        "clangd",
        "cssls",
        "docker_compose_language_service",
        "docker_language_server",
        "html",
        "jsonls",
        "lua_ls",
        "ruff",
        "stylua",
        --  "ts_ls",
        "vimls",
        -- Без настройки этого плагина vue_ls работать не будет.
        -- см. ../../../after/lsp/vtsls.lua
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

    -- Мы тут задаем настройки для всех серверов, и подгружаем пользовательские конфиги
    vim.lsp.config("*", {
      capabilities = capabilities,
      root_markers = { ".git" },
    })

    -- Автодополнение в package.json и др файлах
    vim.lsp.config("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    -- vim.lsp.config("yamlls", {
    --   settings = {
    --     yaml = {
    --       schemaStore = {
    --         -- You must disable built-in schemaStore support if you want to use
    --         -- this plugin and its advanced options like `ignore`.
    --         enable = false,
    --         -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
    --         url = "",
    --       },
    --       schemas = require("schemastore").yaml.schemas(),
    --     },
    --   },
    -- })

    -- Включать требуется только сервера, поставленные вручную
    vim.lsp.enable({
      -- rust-analyzer поставляется вместе с rust, отдельная установка не требуется
      "rust_analyzer",
      -- basedpyright поставлен через 'pnpm add -g', так как при автоматической установке через pip ставится nodejs-wheel — статически-собранный бинарник Node.js и другие +400MiB зависимостей
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
      update_in_insert = false,
    })

    local lsp_group =
      vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = lsp_group,
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local fzf = require("fzf-lua")

        local bufnr = args.buf
        local bufmap = require("user.utils").create_buf_map(bufnr)

        -- Навигация по коду
        -- В некоторых языках возвращается список, тогда fzf-lua бывает полезен
        bufmap("gd", fzf.lsp_definitions, "Go to Definition")
        bufmap("gD", fzf.lsp_declarations, "Go to Declaration")

        -- Справка
        bufmap("K", vim.lsp.buf.hover, "Show Documentation")
        bufmap("<C-k>", vim.lsp.buf.signature_help, "Signature Help", "i")

        -- Встроенные сочетания
        bufmap("grr", fzf.lsp_references, "List References")
        bufmap("gri", fzf.lsp_implementations, "List Implementations")
        bufmap("grt", fzf.lsp_typedefs, "Type Definition")

        -- gra и grn неудобно вводить
        bufmap("<leader>ca", fzf.lsp_code_actions, "Code Actions")
        bufmap("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")

        -- Диагностика
        bufmap("gl", vim.diagnostic.open_float, "Line Diagnostics")
        bufmap("[d", function()
          vim.diagnostic.jump({ count = -1 })
        end, "Prev Diagnostic")
        bufmap("]d", function()
          vim.diagnostic.jump({ count = 1 })
        end, "Next Diagnostic")

        -- Прочие сочетания
        bufmap("gF", fzf.lsp_finder, "LSP Finder")
        bufmap("gO", fzf.lsp_document_symbols, "Document Symbols")
        bufmap("<leader>ls", fzf.lsp_workspace_symbols, "Workspace Symbols")
        bufmap(
          "<leader>ll",
          fzf.lsp_live_workspace_symbols,
          "Live Workspace Symbols"
        )
        bufmap("<leader>lx", fzf.diagnostics_document, "Document Diagnostics")
        bufmap("<leader>lX", fzf.diagnostics_workspace, "Workspace Diagnostics")

        if client.server_capabilities.codeActionProvider then
          bufmap("<leader>co", function()
            vim.lsp.buf.code_action({
              context = {
                only = { "source.organizeImports" },
                diagnostics = {},
              },
              apply = true,
            })
          end, "Code Organize Imports")
        end

        -- Абсолютно бесполезная вещь в динамически-типизированных языках
        -- if client.supports_method("textDocument/codeLens") then
        --   vim.lsp.codelens.refresh({ bufnr = bufnr })
        --   vim.api.nvim_create_autocmd(
        --     { "BufEnter", "InsertLeave", "TextChanged" },
        --     {
        --       group = lsp_group,
        --       buffer = bufnr,
        --       callback = function()
        --         vim.lsp.codelens.refresh({ bufnr = bufnr })
        --       end,
        --     }
        --   )
        --
        --   map("<leader>cl", vim.lsp.codelens.run, "Run CodeLens")
        -- end

        if client.supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

          bufmap("<leader>th", function()
            vim.lsp.inlay_hint.enable(
              not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
              { bufnr = bufnr }
            )
          end, "Toggle Inlay Hints")
        end

        -- Подсветка упоминаний символа
        if client.supports_method("textDocument/documentHighlight") then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = lsp_group,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            group = lsp_group,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })
  end,
}
