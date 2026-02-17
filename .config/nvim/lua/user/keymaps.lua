-- В этом файле определяются основные, не привязанные к плагинам, сочетания
-- клавиш, сгруппированные по режимам.
require("user.utils").set_keymaps({
  n = {
    -- General
    { "<leader>w", "<cmd>w<cr>", "Save File" },
    { "<leader>x", "<cmd>x<cr>", "Save and Quit" },
    { "<leader>q", vim.cmd.quit, "Quit" },
    { "<leader>Q", "<cmd>qa<cr>", "Quit All" },
    { "<leader>a", "ggVG", "Select all" },
    { "<Esc>", "<cmd>noh<cr><esc>", "Clear hlsearch" },
    {
      "<leader>cd",
      "<cmd>lcd %:p:h<cr><cmd>pwd<cr>",
      "Change Directory for current window",
    },

    -- Buffers
    { "<leader>d", "<cmd>bp<bar>bd #<cr>", "Delete Buffer" },
    { "<leader>D", "<cmd>%bd<bar>e #<bar>bd #<cr>", "Delete Other Buffers" },
    { "<tab>", vim.cmd.bnext, "Next Buffer" },
    { "<s-tab>", vim.cmd.bprev, "Previous Buffer" },

    -- Windows
    { "<C-h>", "<cmd>wincmd h<cr>", "Window Left" },
    { "<C-j>", "<cmd>wincmd j<cr>", "Window Down" },
    { "<C-k>", "<cmd>wincmd k<cr>", "Window Up" },
    { "<C-l>", "<cmd>wincmd l<cr>", "Window Right" },
    { "<C-Up>", "<cmd>resize +2<cr>", "Increase Window Height" },
    { "<C-Down>", "<cmd>resize -2<cr>", "Decrease Window Height" },
    { "<C-Left>", "<cmd>vertical resize -2<cr>", "Decrease Window Width" },
    { "<C-Right>", "<cmd>vertical resize +2<cr>", "Increase Window Width" },
    { "<leader>sh", vim.cmd.split, "Split Horizontal" },
    { "<leader>sv", vim.cmd.vsplit, "Split Vertical" },

    -- Movement
    {
      "<Up>",
      "v:count == 0 ? 'gk' : 'k'",
      "Visual Up",
      expr = true,
      replace_keycodes = false,
    },
    {
      "<Down>",
      "v:count == 0 ? 'gj' : 'j'",
      "Visual Down",
      expr = true,
      replace_keycodes = false,
    },

    -- Indentation
    { "<", "<<_", "Decrease Indent" },
    { ">", ">>_", "Increase Indent" },

    -- Move Lines
    { "<A-j>", ":m .+1<CR>==", "Move Down" },
    { "<A-k>", ":m .-2<CR>==", "Move Up" },

    -- Folding
    {
      "<CR>",
      function()
        if vim.fn.foldlevel(".") > 0 then
          return "za"
        end
        return "<CR>"
      end,
      "Toggle Fold",
      expr = true,
    },

    -- Vim
    { "<leader>ve", "<cmd>edit $MYVIMRC<cr>", "Vim Edit" },

    -- Session
    { "<leader>ss", "<cmd>mksession!<cr>", "Session Save" },
    { "<leader>sl", "<cmd>source Session.vim<cr>", "Session Load" },

    -- Package Management
    { "<leader>L", "<cmd>Lazy<cr>", "Lazy" },
    { "<leader>M", "<cmd>Mason<cr>", "Mason" },
  },
  i = {
    -- Indentation
    { "<S-Tab>", "<C-d>", "Decrease Indent" },
  },
  v = {
    -- Indentation
    { "<Tab>", ">gv", "Increase Indent" },
    { "<S-tab>", "<gv", "Decrease Indent" },

    -- Move Lines
    { "<A-j>", ":m '>+1<CR>gv=gv", "Move Selection Down" },
    { "<A-k>", ":m '<-2<CR>gv=gv", "Move Selection Up" },
  },
})
