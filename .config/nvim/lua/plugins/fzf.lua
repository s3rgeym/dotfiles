-- Это какой-то убер-плагин, который просто огромное количество вещей делает
-- через fzf
-- Это лучше задать через rc
-- vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'
return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- Если есть поле keys, то плагин загрузится лишь при вызове этих сочетаний!
  -- Те в других местах нужно обязательно require вызывать
  keys = {
    -- Еще иногда C-f, C-b, C-^, C-o переопределяют, но я ими пользуюсь
    -- Ctrl-G печатает имя текущего файла
    { "<C-g>", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
    { "<C-p>", "<cmd>FzfLua files<cr>", desc = "Files" },
    -- <C-\\> неудобно, а до <C-^> тянуться неудобно
    { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    -- { "<leader>f", group = "Fzf" },
    { "<C-k>", "<cmd>FzfLua builtin<cr>", desc = "Builtin Commands" },
    -- Find
    { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    { "<leader>fh", "<cmd>FzfLua history<cr>", desc = "History" },
    { "<leader>fj", "<cmd>FzfLua jumps<cr>", desc = "Jumps" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
    { "<leader>fl", "<cmd>FzfLua loclist<cr>", desc = "Loclist" },
    { "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "Marks" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Oldfiles" },
    { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume Last Search" },
    -- Git
    { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Git Branches" },
    { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Git Commits" },
    { "<leader>gf", "<cmd>FzfLua git_files<cr>", desc = "Git Files" },
    { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Git Status" },
    {
      "<C-x><C-f>",
      "<cmd>FzfLua complete_path<cr>",
      desc = "Fuzzy complete path",
      mode = { "n", "v", "i" },
    },
  },
  config = function()
    local fzf_lua = require("fzf-lua")

    fzf_lua.setup({
      -- [Fzf-lua] Invalid border style 'border-line', will use 'rounded'.
      winopts = {
        border = "rounded",
      },
      preview = {
        border = "single", -- здесь тоже не должно быть 'border-line'
      },
    })

    -- Без ... будет показывать ошибку
    fzf_lua.register_ui_select()
  end,
}
