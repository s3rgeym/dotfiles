-- Я решил отказаться от использования which-key для объявления сочетаний
-- и пользоваться по возможности keys в lazy

local function map(mode, lhs, rhs, opts_or_desc)
  local opts = { silent = true, noremap = true }
  if type(opts_or_desc) == "string" then
    opts.desc = opts_or_desc
  elseif type(opts_or_desc) == "table" then
    opts = vim.tbl_extend("force", opts, opts_or_desc)
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- General
map("n", "<leader>q", vim.cmd.quit, "Quit")
map("n", "<leader>Q", "<cmd>qa!<cr>", "Quit All")
map("n", "<leader>x", "<cmd>x<cr>", "Save and Quit")
map("n", "<leader>w", vim.cmd.write, "Save")
map("n", "<leader>a", "ggVG", "Select All")

-- Paste keeping current register
map("v", "<leader>p", '"_dP"', "Paste keeping current register")

-- Clear hlsearch
map("n", "<Esc>", "<cmd>noh<cr><esc>", "Clear hlsearch")

-- Directory
map("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", "Change Directory")
map(
  "n",
  "<leader>cD",
  "<cmd>cd %:p:h<cr><cmd>pwd<cr>",
  "Change Directory Globaly"
)

-- Buffers
map("n", "<leader>bd", "<cmd>bp | bd #<cr>", "Delete Buffer")
map("n", "<leader>bD", "<cmd>%bd | e # | bd #<cr>", "Delete Other Buffers")

-- Navigation
map("n", "<Tab>", vim.cmd.bnext, "Next Buffer")
map("n", "<S-Tab>", vim.cmd.bprev, "Previous Buffer")
map("n", "<BS>", "<C-^>", "Last Buffer")

-- Window Navigation
map("n", "<C-Left>", "<cmd>wincmd h<cr>", "Window Left")
map("n", "<C-Down>", "<cmd>wincmd j<cr>", "Window Down")
map("n", "<C-Up>", "<cmd>wincmd k<cr>", "Window Up")
map("n", "<C-Right>", "<cmd>wincmd l<cr>", "Window Right")

-- Resize Windows
map("n", "<A-Up>", "<cmd>resize +2<cr>", "Increase Height")
map("n", "<A-Down>", "<cmd>resize -2<cr>", "Decrease Height")
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", "Decrease Width")
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", "Increase Width")

-- Split Windows
map("n", "<leader>h", vim.cmd.split, "Split Horizontal")
map("n", "<leader>v", vim.cmd.vsplit, "Split Vertical")

-- Movement
map("n", "<Up>", "gk")
map("n", "<Down>", "gj")

-- Move Lines
map("n", "<A-k>", "<cmd>m .-2<CR>==", "Move Line Up")
map("n", "<A-j>", "<cmd>m .+1<CR>==", "Move Line Down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move Selection Up")
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move Selection Down")

-- Indent
map("i", "<S-Tab>", "<C-u>", "Decrease Indent")
map("v", "<Tab>", ">gv", "Increase Indent")
map("v", "<S-Tab>", "<gv", "Decrease Indent")

-- Vim
map("n", "<leader>ev", "<cmd>edit $MYVIMRC<cr>", "Edit Vimrc")
map("n", "<leader>sv", "<cmd>source $MYVIMRC<cr>", "Source Vimrc")

-- Session
map("n", "<leader>ss", "<cmd>mksession!<cr>", "Save Session")
map("n", "<leader>sS", "<cmd>source Session.vim<cr>", "Source Session")
