-- Это какой-то убер-плагин, который просто огромное количество вещей делает
-- через fzf
-- Это лучше задать через rc
-- vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'
local function fzf(func_name, ...)
  local args = { ... }
  return function()
    require("fzf-lua")[func_name](unpack(args))
  end
end

return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- Если есть поле keys, то плагин загрузится лишь при вызове этих сочетаний!
  keys = {
    -- Еще иногда C-f, C-b, C-^, C-o переопределяют, но я ими пользуюсь
    -- Ctrl-G печатает имя текущего файла
    { "<C-g>", fzf("live_grep"), desc = "Grep" },
    { "<C-p>", fzf("files"), desc = "Files" },
    -- <C-\\> неудобно, а до <C-^> тянуться неудобно
    { "<leader>b", fzf("buffers"), desc = "Buffers" },
    -- { "<leader>f", group = "Fzf" },
    { "<C-k>", fzf("builtin"), desc = "Builtin Commands" },
    -- Find
    { "<leader>fc", fzf("commands"), desc = "Commands" },
    { "<leader>fh", fzf("history"), desc = "History" },
    { "<leader>fj", fzf("jumps"), desc = "Jumps" },
    { "<leader>fk", fzf("keymaps"), desc = "Keymaps" },
    { "<leader>fl", fzf("loclist"), desc = "Loclist" },
    { "<leader>fm", fzf("marks"), desc = "Marks" },
    { "<leader>fo", fzf("oldfiles"), desc = "Oldfiles" },
    { "<leader>fq", fzf("quickfix"), desc = "Quickfix" },
    { "<leader>fr", fzf("resume"), desc = "Resume Last Search" },
    -- Git
    { "<leader>gb", fzf("git_branches"), desc = "Git Branches" },
    { "<leader>gc", fzf("git_commits"), desc = "Git Commits" },
    { "<leader>gf", fzf("git_files"), desc = "Git Files" },
    { "<leader>gs", fzf("git_status"), desc = "Git Status" },
    {
      "<C-x><C-f>",
      fzf("complete_path"),
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
