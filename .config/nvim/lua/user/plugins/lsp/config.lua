local M = {}

M.setup = function()
  local handlers = require("user.plugins.lsp.handlers")

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

  vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_group,
    callback = function(args)
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
      handlers.on_attach(client, args.buf)
    end,
  })
end

return M
