return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- "folke/trouble.nvim",
  },
  keys = {
    -- Other
    { "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
    { "<leader>p", "<cmd>FzfLua files<cr>", desc = "Files" },
    { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    { "<leader>m", "<cmd>FzfLua marks<cr>", desc = "Marks" },
    { "<leader>:", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>FzfLua command_history<cr>", desc = "History" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
    { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume Last Search" },
    { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
    { "<leader>fl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
    { "<leader>fj", "<cmd>FzfLua jumps<cr>", desc = "Jumps" },
    { "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "Marks" },
    { "<leader>fR", "<cmd>FzfLua registers<cr>", desc = "Registers" },
    { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Status" },
    { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Commits" },
    { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Branches" },
    { "<leader>gf", "<cmd>FzfLua git_files<cr>", desc = "Files" },
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
