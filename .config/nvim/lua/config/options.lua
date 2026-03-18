-- Эти настройки будут применены до загрузки init.lua
-- Клавишу leader надо объявить до загрузки плагинов
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Создаем локальную переменную для краткости
local opt = vim.opt

if vim.fn.has("termguicolors") == 1 then
  -- Некоторые плагины могут неправильно работать, если не установить это значение
  opt.termguicolors = true
end

-- У меня был соблазн все это в массив загнать, а потом задать значения для
-- vim.opt, но из-за того, что порядок задания значений не соблюдается,
-- возникают странные баги

-- Interface
-- Show absolute line numbers
opt.number = true
-- Show relative line numbers
opt.relativenumber = true
-- Highlight the line under the cursor
opt.cursorline = true
-- Always show sign column
opt.signcolumn = "yes"
-- Always display the status line
opt.laststatus = 3
-- Do not show current mode
-- o.showmode = false
-- Enable 24-bit colors
opt.termguicolors = true
-- o.showtabline = 2

-- Cursor and scrolling
-- Context lines above/below cursor
opt.scrolloff = 8
-- Context columns left/right
opt.sidescrolloff = 8
-- Allow cursor to wrap across lines
opt.whichwrap = "h,l,<,>,[,]"
-- Enable mouse support
opt.mouse = "a"

-- Text wrapping
-- Enable visual line wrapping
opt.wrap = true
-- Wrap at word boundaries
opt.linebreak = true
-- Keep indentation on wrapped lines
opt.breakindent = true
-- Mark wrapped line continuation
opt.showbreak = "↪ "

-- Text editing
-- Use spaces instead of tabs
opt.expandtab = true
-- Visual tab width
opt.tabstop = 4
-- Indent width
opt.shiftwidth = 2
-- Insert/delete spaces with Tab
opt.softtabstop = 2
-- Tab respects shiftwidth at line start
opt.smarttab = true
-- Copy indent from previous line
opt.autoindent = true
-- Smart indent for C-like code
opt.smartindent = true
-- One space after sentence join
-- o.joinspaces = false
-- Preferred line length
opt.textwidth = 80
-- Не имеет эффекта в арче, так как устанавливается через плагины после загрузки init.lua
-- o.formatoptions = { j = true, q = true }

-- Invisible characters
opt.list = true
opt.listchars:append({
  tab = "→ ",
  trail = "·",
  nbsp = "␣",
})

-- Search
-- Case-insensitive search
opt.ignorecase = true
-- Case-sensitive if uppercase used
opt.smartcase = true
-- Highlight search matches
opt.hlsearch = true
-- Incremental search
opt.incsearch = true
-- Live substitute preview
opt.inccommand = "split"

-- Wildmenu
-- Ignore case in command line
opt.wildignorecase = true
opt.wildignore:append({
  "*/.git/*",
  "*/node_modules/*",
})

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.backspace = { "indent", "eol", "start" }

-- Files and buffers
-- Use system clipboard
opt.clipboard = "unnamedplus"
-- Disable swap files
opt.swapfile = false
-- Disable backup files
opt.backup = false
-- Persistent undo
opt.undofile = true
-- Allow buffer switching without saving
opt.hidden = true
-- Reload files changed externally
opt.autoread = true
-- Confirm before losing changes
opt.confirm = true
-- Disables configuration lines inside text files (modelines).
-- Although often off by default in some distributions,
-- explicitly setting it to false prevents potential shell command injection.
opt.modeline = false

-- Session and Shada
-- Options are not saved in sessions to avoid plugin conflicts
opt.sessionoptions = "buffers,curdir,tabpages,winsize,help,folds,localoptions"
-- Shada files store cursor position, marks, and registers
opt.shada = "!,'100,<1000,s10,h"

-- Windows
-- Horizontal splits open below
opt.splitbelow = true
-- Vertical splits open right
opt.splitright = true

-- Performance
-- Faster CursorHold / diagnostics
opt.updatetime = 200
-- Key sequence timeout
opt.timeoutlen = 500

-- Russian keyboard layout
-- Use <c-^> (Ctrl-6) to toggle internal keymap
opt.keymap = "russian-jcukenwin"
opt.iminsert = 0
opt.imsearch = -1

-- Keep shortcuts working when switching layouts
opt.langmap =
  [[ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz]]

-- Show concealed text
opt.conceallevel = 0

-- for k, v in pairs(options) do
--   vim.opt[k] = v
-- end
