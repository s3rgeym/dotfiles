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
    "neovim/nvim-lspconfig",
    "saghen/blink.cmp",
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
        local bufnr = args.buf

        -- Установка сочетаний клавиш для конкретного буфера
        local function map(lhs, rhs, desc, mode)
          vim.keymap.set(mode or "n", lhs, rhs, { desc = "LSP: " .. desc, buffer = bufnr })
        end

        map("gd", vim.lsp.buf.definition, "Go to Definition")
        map("gD", vim.lsp.buf.declaration, "Go to Declaration")
        map("K", vim.lsp.buf.hover, "Show Documentation")
        map("<C-k>", vim.lsp.buf.signature_help, "Signature Help", "i")
        map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        map("gl", vim.diagnostic.open_float, "Line Diagnostics")
        map("[d", function()
          vim.diagnostic.jump({ count = -1 })
        end, "Prev Diagnostic")
        map("]d", function()
          vim.diagnostic.jump({ count = 1 })
        end, "Next Diagnostic")

        -- if client.supports_method("textDocument/codeAction") then
        --   map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
        -- end

        if client.server_capabilities.codeActionProvider then
          map("<leader>co", function()
            vim.lsp.buf.code_action({
              context = {
                only = { "source.organizeImports" },
                diagnostics = {},
              },
              apply = true,
            })
          end, "Code Organize Imports")
        end

        if client.supports_method("textDocument/codeLens") then
          vim.lsp.codelens.refresh({ bufnr = bufnr })
          vim.api.nvim_create_autocmd(
            { "BufEnter", "InsertLeave", "TextChanged" },
            {
              group = lsp_group,
              buffer = bufnr,
              callback = function()
                vim.lsp.codelens.refresh({ bufnr = bufnr })
              end,
            }
          )
          map("<leader>cl", vim.lsp.codelens.run, "Run CodeLens")
        end

        if client.supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

          map("<leader>th", function()
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
