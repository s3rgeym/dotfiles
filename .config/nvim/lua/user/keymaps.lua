local map = require("user.utils").map

-- General
map("<leader>w", "<cmd>w<cr>", "Save File")
map("<leader>x", "<cmd>x<cr>", "Save and Quit")
map("<leader>q", vim.cmd.quit, "Quit")
map("<leader>Q", "<cmd>qa<cr>", "Quit All")
map("<leader>a", "ggVG", "Select all")
map("<Esc>", "<cmd>noh<cr><esc>", "Clear hlsearch")
map("<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", "Change Directory for current window")

-- Buffers
map("<leader>d", "<cmd>bp<bar>bd #<cr>", "Delete Buffer")
map("<leader>D", "<cmd>%bd<bar>e #<bar>bd #<cr>", "Delete Other Buffers")

-- Navigation
map("<Tab>", vim.cmd.bnext, "Next Buffer")
map("<S-Tab>", vim.cmd.bprev, "Previous Buffer")
map("<C-h>", "<cmd>wincmd h<cr>", "Window Left")
map("<C-j>", "<cmd>wincmd j<cr>", "Window Down")
map("<C-k>", "<cmd>wincmd k<cr>", "Window Up")
map("<C-l>", "<cmd>wincmd l<cr>", "Window Right")

-- Resize Windows
map("<C-Up>", "<cmd>resize +2<cr>", "Increase Window Height")
map("<C-Down>", "<cmd>resize -2<cr>", "Decrease Window Height")
map("<C-Left>", "<cmd>vertical resize -2<cr>", "Decrease Window Width")
map("<C-Right>", "<cmd>vertical resize +2<cr>", "Increase Window Width")

-- Movement
map("<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Visual Up", expr = true, replace_keycodes = false })
map("<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Visual Down", expr = true, replace_keycodes = false })

-- Split Windows
map("<leader>sh", vim.cmd.split, "Split Horizontal")
map("<leader>sv", vim.cmd.vsplit, "Split Vertical")

-- Indentation
map("<", "<<_", "Decrease Indent")
map(">", ">>_", "Increase Indent")
map("<S-Tab>", "<C-d>", "Decrease Indent", "i")
map("<Tab>", ">gv", "Increase Indent", "v")
map("<S-tab>", "<gv", "Decrease Indent", "v")

-- Move Lines
map("<A-j>", ":m .+1<CR>==", "Move Down")
map("<A-k>", ":m .-2<CR>==", "Move Up")
map("<A-j>", ":m '>+1<CR>gv=gv", "Move Selection Down", "v")
map("<A-k>", ":m '<-2<CR>gv=gv", "Move Selection Up", "v")

-- Folding
map("<CR>", function()
  return vim.fn.foldlevel(".") > 0 and "za" or "<CR>"
end, { desc = "Toggle Fold", expr = true })

-- Vim
map("<leader>ve", "<cmd>edit $MYVIMRC<cr>", "Edit Vim")

-- Session
map("<leader>ss", "<cmd>mksession!<cr>", "Session Save")
map("<leader>sl", "<cmd>source Session.vim<cr>", "Session Load")

-- Package Management
map("<leader>L", "<cmd>Lazy<cr>", "Lazy")
map("<leader>M", "<cmd>Mason<cr>", "Mason")

