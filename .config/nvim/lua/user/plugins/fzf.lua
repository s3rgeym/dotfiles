return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- "folke/trouble.nvim",
  },
  config = function()
    -- calling setup is optional, most of the defaults are fine
    local fzf = require("fzf-lua")

    fzf.setup({
      -- [Fzf-lua] Invalid border style 'border-line', will use 'rounded'.
      winopts = {
        border = "rounded",
      },
      preview = {
        border = "single", -- здесь тоже не должно быть 'border-line'
      },
    })

    -- Без ... будет показывать ошибку
    fzf.register_ui_select()

    -- Интеграция с trouble
    -- local config = require("fzf-lua.config")
    -- local actions = require("trouble.sources.fzf").actions
    -- config.defaults.actions.files["ctrl-t"] = actions.open
  end,
}
