---@diagnostic disable: missing-parameter, param-type-mismatch
-- Конфиги LSP, идущие вместе с плагином:
-- - ~/.local/share/nvim/lazy/nvim-lspconfig/lsp/

-- Пользовательские конфиги:
-- - ~/.config/nvim/lsp — для переопределения или заданиях новых.
-- - ~/.config/nvim/after/lsp — для расширения существующих.
local M = {}

M.setup = function()
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
      require("user.lsp.handlers").on_attach(client, args.buf)
    end,
  })
end

return M
