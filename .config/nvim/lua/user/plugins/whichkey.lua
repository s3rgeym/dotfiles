return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    defaults = {
      ["<leader>f"] = { name = "Find" },
      ["<leader>g"] = { name = "Git" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {
      "<leader>k",
      function()
        require("which-key").show()
      end,
      desc = "Show All Keymaps (which-key)",
    },
    {
      "<leader>K",
      function()
        local mode = vim.fn.input("Enter mode: ")
        if mode ~= "" then
          require("which-key").show({ mode = mode })
        end
      end,
      desc = "Show Mode Keymaps (which-key)",
    },
  },
}

