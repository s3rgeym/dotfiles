return {
  { "<leader>f", group = "Find" },
  { "<leader>g", group = "Git" },

  -- General
  { "<leader>w", "<cmd>w<cr>", desc = "Save File" },
  { "<leader>x", "<cmd>x<cr>", desc = "Save and Quit" },
  { "<leader>q", vim.cmd.quit, desc = "Quit" },
  { "<leader>Q", "<cmd>qa<cr>", desc = "Quit All" },
  { "<leader>a", "ggVG", desc = "Select all" },
  { "<Esc>", "<cmd>noh<cr><esc>", desc = "Clear hlsearch" },
  {
    "<leader>cd",
    "<cmd>lcd %:p:h<cr><cmd>pwd<cr>",
    desc = "Change Directory for current window",
  },

  -- Buffers
  { "<leader>d", "<cmd>bp<bar>bd #<cr>", desc = "Delete Buffer" },
  {
    "<leader>D",
    "<cmd>%bd<bar>e #<bar>bd #<cr>",
    desc = "Delete Other Buffers",
  },

  -- Navigation
  { "<Tab>", vim.cmd.bnext, desc = "Next Buffer" },
  { "<S-Tab>", vim.cmd.bprev, desc = "Previous Buffer" },
  { "<C-h>", "<cmd>wincmd h<cr>", desc = "Window Left" },
  { "<C-j>", "<cmd>wincmd j<cr>", desc = "Window Down" },
  { "<C-k>", "<cmd>wincmd k<cr>", desc = "Window Up" },
  { "<C-l>", "<cmd>wincmd l<cr>", desc = "Window Right" },
  { "<C-Up>", "<cmd>resize +2<cr>", desc = "Increase Window Height" },
  { "<C-Down>", "<cmd>resize -2<cr>", desc = "Decrease Window Height" },
  { "<C-Left>", "<cmd>vertical resize -2<cr>", desc = "Decrease Window Width" },
  {
    "<C-Right>",
    "<cmd>vertical resize +2<cr>",
    desc = "Increase Window Width",
  },

  -- Movement
  {
    "<Up>",
    "v:count == 0 ? 'gk' : 'k'",
    desc = "Visual Up",
    expr = true,
    replace_keycodes = false,
  },
  {
    "<Down>",
    "v:count == 0 ? 'gj' : 'j'",
    desc = "Visual Down",
    expr = true,
    replace_keycodes = false,
  },

  -- Split Windows
  { "<leader>sh", vim.cmd.split, desc = "Split Horizontal" },
  { "<leader>sv", vim.cmd.vsplit, desc = "Split Vertical" },

  -- Indentation
  { "<", "<<_", desc = "Decrease Indent" },
  { ">", ">>_", desc = "Increase Indent" },
  { "<S-Tab>", "<C-d>", desc = "Decrease Indent", mode = "i" },
  { "<Tab>", ">gv", desc = "Increase Indent", mode = "v" },
  { "<S-tab>", "<gv", desc = "Decrease Indent", mode = "v" },

  -- Move Lines
  { "<A-j>", ":m .+1<CR>==", desc = "Move Down" },
  { "<A-k>", ":m .-2<CR>==", desc = "Move Up" },
  { "<A-j>", ":m '>+1<CR>gv=gv", desc = "Move Selection Down", mode = "v" },
  { "<A-k>", ":m '<-2<CR>gv=gv", desc = "Move Selection Up", mode = "v" },

  -- Folding
  {
    "<CR>",
    function()
      return vim.fn.foldlevel(".") > 0 and "za" or "<CR>"
    end,
    desc = "Toggle Fold",
    expr = true,
  },

  -- Vim
  { "<leader>ve", "<cmd>edit $MYVIMRC<cr>", desc = "Edit Vim" },

  -- Session
  { "<leader>ss", "<cmd>mksession!<cr>", desc = "Session Save" },
  { "<leader>sl", "<cmd>source Session.vim<cr>", desc = "Session Load" },

  -- Package Management
  { "<leader>L", "<cmd>Lazy<cr>", desc = "Lazy" },
  { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" },
}
