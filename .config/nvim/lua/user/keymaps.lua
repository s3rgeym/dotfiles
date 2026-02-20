return {
  -- General
  { "<leader>a", "ggVG", desc = "Select all" },
  { "<Esc>", "<cmd>noh<cr><esc>", desc = "Clear hlsearch" },
  { "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", desc = "Change Directory" },

  -- Buffers
  {
    "<leader>d",
    --"<cmd>execute len(getbufinfo({'buflisted':1}))>1 ? 'bp | bd #' : 'bd'<cr>",
    "<cmd>bp | bd #<cr>",
    desc = "Delete Buffer",
  },
  {
    "<leader>D",
    "<cmd>%bd | e # | bd #<cr>",
    desc = "Delete Other Buffers",
  },
  { "<Tab>", vim.cmd.bnext, desc = "Next Buffer" },
  { "<S-Tab>", vim.cmd.bprev, desc = "Previous Buffer" },
  { "<BS>", "<C-^>", desc = "Last Buffer" },

  -- Tabs & Windows Navigation
  { "<A-Left>", "gT", desc = "Previous Tab" },
  { "<A-Right>", "gt", desc = "Next Tab" },
  { "<C-h>", "<cmd>wincmd h<cr>", desc = "Window Left" },
  { "<C-j>", "<cmd>wincmd j<cr>", desc = "Window Down" },
  { "<C-k>", "<cmd>wincmd k<cr>", desc = "Window Up" },
  { "<C-l>", "<cmd>wincmd l<cr>", desc = "Window Right" },

  -- Resize Windows
  { "<C-Up>", "<cmd>resize +2<cr>", desc = "Increase Height" },
  { "<C-Down>", "<cmd>resize -2<cr>", desc = "Decrease Height" },
  { "<C-Left>", "<cmd>vertical resize -2<cr>", desc = "Decrease Width" },
  { "<C-Right>", "<cmd>vertical resize +2<cr>", desc = "Increase Width" },

  -- Split Windows
  { "<leader>sh", vim.cmd.split, desc = "Split Horizontal" },
  { "<leader>sv", vim.cmd.vsplit, desc = "Split Vertical" },

  -- Movement (Normal)
  { "<Up>", "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Visual Up" },
  { "<Down>", "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Visual Down" },
  { "<A-Up>", ":m .-2<CR>==", desc = "Move Line Up" },
  { "<A-Down>", ":m .+1<CR>==", desc = "Move Line Down" },

  -- Movement & Selection (Visual)
  {
    mode = "v",
    { "<A-Up>", ":m '<-2<CR>gv=gv", desc = "Move Selection Up" },
    { "<A-Down>", ":m '>+1<CR>gv=gv", desc = "Move Selection Down" },
    { "<Tab>", ">gv", desc = "Increase Indent" },
    { "<S-Tab>", "<gv", desc = "Decrease Indent" },
  },

  -- Indentation (Normal)
  { "<", "<<_", desc = "Decrease Indent" },
  { ">", ">>_", desc = "Increase Indent" },

  -- Folding & System
  {
    "<CR>",
    function()
      return vim.fn.foldlevel(".") > 0 and "za" or "<CR>"
    end,
    expr = true,
    desc = "Toggle Fold",
  },
  { "<leader>e", "<cmd>edit $MYVIMRC<cr>", desc = "Edit Vim Config" },
  { "<leader>ss", "<cmd>mksession!<cr>", desc = "Save Session" },
  { "<leader>sl", "<cmd>source Session.vim<cr>", desc = "Session Load" },
  { "<leader>L", "<cmd>Lazy<cr>", desc = "Lazy" },
  { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" },
}
