local function cmd(command)
  return "<Cmd>" .. command .. "<CR>"
end

local wk = require("which-key")
wk.setup()

wk.add({
  { "<leader>q",  vim.cmd.quit,             desc = "Quit" },
  { "<leader>x",  cmd [[bp|bd #]],          desc = "Close current buffer" },
  { "<leader>X",  cmd [[%bd|e #|bd #]],     desc = "Close other buffers" },
  { "<leader>y",  cmd [[%y]],               desc = "Yank all" },
  { "<leader>p",  "ggVGp",                  desc = "Replace buffer with register" },

  -- Files
  { "<leader>e",  vim.cmd.Ex,               desc = "Explorer (:Ex)" },
  { "<leader>f",  cmd [[FzfLua files]],     desc = "Find file" },
  { "<leader>b",  cmd [[FzfLua buffers]],   desc = "Find buffer" },
  { "<leader>g",  cmd [[FzfLua live_grep]], desc = "Grep project" },
  { "<leader>r",  cmd [[FzfLua resume]],    desc = "Resume last picker" },

  -- Buffers
  { "<tab>",      vim.cmd.bnext,            desc = "Next buffer" },
  { "<s-tab>",    vim.cmd.bprev,            desc = "Prev buffer" },

  -- Navigation for wrapped lines
  -- { "k",         "gk",               silent = true },
  -- { "j",         "gj",               silent = true },
  -- { "<Up>",      "gk",               silent = true },
  -- { "<Down>",    "gj",               silent = true },

  -- Windows
  { "<c-h>",      "<c-w>h",                 desc = "Left window" },
  { "<c-j>",      "<c-w>j",                 desc = "Down window" },
  { "<c-k>",      "<c-w>k",                 desc = "Up window" },
  { "<c-l>",      "<c-w>l",                 desc = "Right window" },

  -- Indent/Unindent
  { "<",          "<<_",                    desc = "Unindent line",               noremap = true, silent = true },
  { ">",          ">>_",                    desc = "Indent line",                 noremap = true, silent = true },
  { "<",          "<gv",                    desc = "Unindent lines",              noremap = true, silent = true, mode = "v" },
  { ">",          ">gv",                    desc = "Indent lines",                noremap = true, silent = true, mode = "v" },

  -- Move lines

  -- nnoremap <A-j> :m .+1<CR>==
  -- nnoremap <A-k> :m .-2<CR>==
  -- inoremap <A-j> <Esc>:m .+1<CR>==gi
  -- inoremap <A-k> <Esc>:m .-2<CR>==gi
  -- vnoremap <A-j> :m '>+1<CR>gv=gv
  -- vnoremap <A-k> :m '<-2<CR>gv=gv
  { "<A-k>",      ":m .-2<CR>==",           desc = "Move line up" },
  { "<A-j>",      ":m .+1<CR>==",           desc = "Move line down" },
  { "<A-k>",      ":m '<-2<CR>gv=gv",       desc = "Move selection up",           mode = "v" },
  { "<A-j>",      ":m '>+1<CR>gv=gv",       desc = "Move selection down",         mode = "v" },

  { "<leader>ev", cmd [[edit $MYVIMRC]],    desc = "Edit neo[v]im config" },
  { "<leader>rv", vim.cmd.restart,          desc = "Restart neo[v]im" },

  {
    "<leader>?",
    function()
      wk.show({ global = false })
    end,
    desc = "Buffer Local Keymaps (which-key)",
  },
  {
    "<leader>k",
    wk.show,
    desc = "Show all keyamps"
  },
  {
    "<leader>K",
    function()
      local mode = vim.fn.input("Which-key mode (n/i/v/x/t/...): ")
      if mode ~= "" then
        wk.show({ mode = mode })
      end
    end,
    desc = "Show keymaps for specific mode"
  },
})
