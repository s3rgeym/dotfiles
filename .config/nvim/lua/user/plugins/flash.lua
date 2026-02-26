-- Я им не пользуюсь. Его можно выкинуть
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = require("user.keymaps").flash,
  ---@type Flash.Config
  opts = {
    modes = {
      -- Использовать flash при поиске через /, ?
      -- search = {
      --   enabled = true,
      -- },
      char = {
        -- Прыжки с помощью f/t/F/T
        jump_labels = true,
      },
    },
  },
}
