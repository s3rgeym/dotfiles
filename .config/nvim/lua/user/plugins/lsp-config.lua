---@diagnostic disable: missing-parameter
local create_autocmd = vim.api.nvim_create_autocmd

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- opts передается для автоматического вызова setup
    { "mason-org/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    "b0o/schemastore.nvim",
    -- Для установки сочетаний
    "folke/which-key.nvim",
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
      update_in_insert = false,
    })

    local lsp_group =
      vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

    create_autocmd("LspAttach", {
      group = lsp_group,
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local bufnr = args.buf

        require("user.keymaps").set_keymaps("lsp", bufnr)

        -- Включаем Inlay Hints по умолчанию
        if client.supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
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
