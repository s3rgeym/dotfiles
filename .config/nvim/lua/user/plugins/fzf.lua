-- Это какой-то убер-плагин, который просто огромное количество вещей делает
-- через fzf
-- Это лучше задать через rc
-- vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'

return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
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
  end,
}
