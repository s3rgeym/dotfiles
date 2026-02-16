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
      ensure_installed = {
        "bashls",
        "biome",
        "cssls",
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
      -- basedpyright поставлен через 'pnpm add -g', чтобы избежать так как при
      -- автоматической установке через pip ставится nodejs-wheel — полноценный
      -- бинарник Node.js
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

        -- Вынес все сочетания в ./whichkey.lua чтобы их редактировать в одном
        -- месте
        -- local function map(lhs, rhs, desc_or_opts, mode)
        --   local opts = type(desc_or_opts) == "string"
        --       and { desc = desc_or_opts }
        --     or vim.deepcopy(desc_or_opts or {})
        --
        --   opts.buffer = bufnr
        --   if opts.desc then
        --     opts.desc = "LSP: " .. opts.desc
        --   end
        --
        --   vim.keymap.set(mode or "n", lhs, rhs, opts)
        -- end

        -- CodeLens: автоматическое обновление и запуск
        if client.supports_method("textDocument/codeLens") then
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
        end

        -- Inlay Hints
        if client.supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
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
