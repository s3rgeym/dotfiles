-- Эти настройки будут применены до загрузки init.lua
-- Клавишу leader надо объявить до загрузки плагинов
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

if vim.fn.has("termguicolors") == 1 then
  -- Некоторые плагины могут неправильно работать, если не установить это значение
  opt.termguicolors = true
end

-- Interface
opt.number = true -- Show absolute line numbers
opt.cursorline = true -- Highlight the line under the cursor
opt.signcolumn = "yes" -- Always show sign column
opt.laststatus = 3 -- Always display the status line
opt.showmode = false -- Do not show current mode
opt.shortmess:append("I") -- Skip startup intro
opt.termguicolors = true -- Enable 24-bit colors
opt.fillchars:append({ eob = " " }) -- Remove "~" at the end of the file
opt.guicursor = "n-c:block,i-ci-ve:ver25,v-r-cr:hor20,o:hor50" -- Set cursor shape for different modes

-- Cursor and scrolling
opt.scrolloff = 5 -- Context lines above/below cursor
opt.sidescrolloff = 5 -- Context columns left/right
opt.whichwrap = "h,l,<,>,[,]" -- Allow cursor to wrap across lines
opt.mouse = "a" -- Enable mouse support

-- Text wrapping
opt.wrap = true -- Enable visual line wrapping
opt.linebreak = true -- Wrap at word boundaries
opt.breakindent = true -- Keep indentation on wrapped lines
opt.showbreak = "↪ " -- Mark wrapped line continuation

-- Text editing
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- Visual tab width
opt.shiftwidth = 2 -- Indent width
opt.softtabstop = 2 -- Insert/delete spaces with Tab
opt.smarttab = true -- Tab respects shiftwidth at line start
opt.autoindent = true -- Copy indent from previous line
opt.smartindent = true -- Smart indent for C-like code
--opt.joinspaces = false -- One space after sentence join
opt.textwidth = 80 -- Preferred line length
-- Не имеет эффекта
--o.formatoptions:remove("c")
--o.formatoptions:remove("r")
--o.formatoptions:remove("o")
-- В which-key всплывающее окно вызывает
-- o.keymodel = "startsel,stopsel" -- Shift + Arrows to select

-- Invisible characters
opt.list = true

opt.listchars = {
  tab = "→ ",
  trail = "·",
  nbsp = "␣",
}

-- Search
opt.ignorecase = true -- Case-insensitive search
opt.smartcase = true -- Case-sensitive if uppercase used
opt.hlsearch = true -- Highlight search matches
opt.incsearch = true -- Incremental search
opt.inccommand = "split" -- Live substitute preview

-- Wildmenu
opt.wildignorecase = true -- Ignore case in command line
opt.wildignore:append({
  "*/.git/*",
  "*/node_modules/*",
})

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.backspace = { "indent", "eol", "start" }

-- Files and buffers
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.swapfile = false -- Disable swap files
opt.backup = false -- Disable backup files
opt.undofile = true -- Persistent undo
opt.hidden = true -- Allow buffer switching without saving
opt.autoread = true -- Reload files changed externally
opt.confirm = true -- Confirm before losing changes
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
opt.splitbelow = true -- Horizontal splits open below
opt.splitright = true -- Vertical splits open right

-- Performance
opt.updatetime = 200 -- Faster CursorHold / diagnostics
opt.timeoutlen = 500 -- Key sequence timeout

-- Russian keyboard layout
-- Use <c-^> (Ctrl-6) to toggle internal keymap
opt.keymap = "russian-jcukenwin"
opt.iminsert = 0
opt.imsearch = -1

-- Keep shortcuts working when switching layouts
opt.langmap =
  [[ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz]]

opt.conceallevel = 0 -- Show concealed text
