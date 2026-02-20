-- Это лучше задать через rc
-- vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- "folke/trouble.nvim",
  },
  keys = {
    { "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
    { "<leader>:", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    {
      "<leader>ch",
      "<cmd>FzfLua command_history<cr>",
      desc = "Command History",
    },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Find Keymaps" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Find Resume" },
    { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Git Branches" },
    { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Git Commits" },
    { "<leader>gf", "<cmd>FzfLua git_files<cr>", desc = "Git Files" },
    { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Git Status" },
    { "<leader>h", "<cmd>FzfLua history<cr>", desc = "History" },
    { "<leader>j", "<cmd>FzfLua jumps<cr>", desc = "Jumps" },
    { "<leader>lo", "<cmd>FzfLua loclist<cr>", desc = "Loclist" },
    { "<leader>m", "<cmd>FzfLua marks<cr>", desc = "Marks" },
    { "<leader>o", "<cmd>FzfLua oldfiles<cr>", desc = "Oldfiles" },
    { "<leader>p", "<cmd>FzfLua files<cr>", desc = "Files" },
    { "<leader>qf", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix" },
    { '<leader>"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
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
