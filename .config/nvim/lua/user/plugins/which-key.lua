return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = require("user.keymaps").get_keymaps("which_key"),
  opts = {
    preset = "modern",
    spec = {
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
    },
  },
}
