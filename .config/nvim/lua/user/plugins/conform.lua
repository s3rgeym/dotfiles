-- :MasonInstall ruff stylua biome prettier shellcheck shfmt
-- Если мы форматируем через conform, то настройки, заданные в конфигах lsp не
-- применяются!!!
local formatters_by_ft = {
  -- https://docs.astral.sh/ruff/editors/setup/#neovim
  python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
  lua = { "stylua" },
  go = { "goimports", "gofmt" },
  rust = { "rustfmt" },
  bash = { "shfmt" },
  -- Ломает специфический для zsh синтаксис
  --zsh = { "shfmt" },
  javascript = { "biome" },
  typescript = { "biome" },
  vue = { "biome" },
  json = { "biome" },
  jsonc = { "biome" },
  html = { "prettier" },
  css = { "biome" },
  scss = { "biome" },
  yaml = { "prettier" },
  markdown = { "prettier" },
}

return {
  "stevearc/conform.nvim",
  -- Если задан keys, то плагин загрузится лишь по сочетанию, те до ручного
  -- вызова форматирования, оно не будет запускаться при сохранении
  -- keys = {
  --   {
  --     "<leader>cf",
  --     function()
  --       require("conform").format({ lsp_format = "fallback" })
  --     end,
  --     desc = "Code Format",
  --   },
  -- },
  config = function()
    require("conform").setup({
      formatters_by_ft = formatters_by_ft,
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
      -- Настройки для форматтеров
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci", "-s" },
        },
        stylua = {
          -- prepend_args = { "--config", vim.fn.expand("~/.config/stylua/stylua.toml") },
        },
      },
    })
    require("user.keymaps").setup("conform")
  end,
}
