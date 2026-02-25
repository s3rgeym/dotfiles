local o = vim.opt

-- Interface
o.number = true -- Show absolute line numbers
o.cursorline = true -- Highlight the line under the cursor
o.signcolumn = "yes" -- Always show sign column
o.laststatus = 3 -- Always display the status line
o.showmode = false -- Do not show current mode
o.shortmess:append("I") -- Skip startup intro
o.colorcolumn = "+1" -- Column right after textwidth
o.termguicolors = true -- Enable 24-bit colors
o.fillchars:append({ eob = " " }) -- Remove "~" at the end of the file
o.guicursor = "n-c:block,i-ci-ve:ver25,v-r-cr:hor20,o:hor50" -- Set cursor shape for different modes

-- Cursor and scrolling
o.scrolloff = 5 -- Context lines above/below cursor
o.sidescrolloff = 5 -- Context columns left/right
o.whichwrap = "h,l,<,>,[,]" -- Allow cursor to wrap across lines
o.mouse = "a" -- Enable mouse support

-- Text wrapping
o.wrap = true -- Enable visual line wrapping
o.linebreak = true -- Wrap at word boundaries
o.breakindent = true -- Keep indentation on wrapped lines
o.showbreak = "↪ " -- Mark wrapped line continuation

-- Text editing
o.expandtab = true -- Use spaces instead of tabs
o.tabstop = 4 -- Visual tab width
o.shiftwidth = 2 -- Indent width
o.softtabstop = 2 -- Insert/delete spaces with Tab
o.smarttab = true -- Tab respects shiftwidth at line start
o.autoindent = true -- Copy indent from previous line
o.smartindent = true -- Smart indent for C-like code
--opt.joinspaces = false -- One space after sentence join
o.textwidth = 80 -- Preferred line length
-- Не имеет эффекта
--o.formatoptions:remove("c")
--o.formatoptions:remove("r")
--o.formatoptions:remove("o")
-- В which-key всплывающее окно вызывает
-- o.keymodel = "startsel,stopsel" -- Shift + Arrows to select

-- Invisible characters
o.list = true

o.listchars = {
  tab = "→ ",
  trail = "·",
  nbsp = "␣",
}

-- Search
o.ignorecase = true -- Case-insensitive search
o.smartcase = true -- Case-sensitive if uppercase used
o.hlsearch = true -- Highlight search matches
o.incsearch = true -- Incremental search
o.inccommand = "split" -- Live substitute preview

-- Wildmenu
o.wildignorecase = true -- Ignore case in command line
o.wildignore:append({
  "*/.git/*",
  "*/node_modules/*",
})

-- Completion
o.completeopt = { "menu", "menuone", "noselect" }
o.backspace = { "indent", "eol", "start" }

-- Files and buffers
o.clipboard = "unnamedplus" -- Use system clipboard
o.swapfile = false -- Disable swap files
o.backup = false -- Disable backup files
o.undofile = true -- Persistent undo
o.hidden = true -- Allow buffer switching without saving
o.autoread = true -- Reload files changed externally
o.confirm = true -- Confirm before losing changes
-- Disables configuration lines inside text files (modelines).
-- Although often off by default in some distributions,
-- explicitly setting it to false prevents potential shell command injection.
o.modeline = false

-- Session and Shada
-- Options are not saved in sessions to avoid plugin conflicts
o.sessionoptions = "buffers,curdir,tabpages,winsize,help,folds,localoptions"
-- Shada files store cursor position, marks, and registers
o.shada = "!,'100,<1000,s10,h"

-- Windows
o.splitbelow = true -- Horizontal splits open below
o.splitright = true -- Vertical splits open right

-- Performance
o.updatetime = 200 -- Faster CursorHold / diagnostics
o.timeoutlen = 500 -- Key sequence timeout

-- Russian keyboard layout
-- Use <c-^> (Ctrl-6) to toggle internal keymap
o.keymap = "russian-jcukenwin"
o.iminsert = 0
o.imsearch = -1

-- Keep shortcuts working when switching layouts
o.langmap =
  [[ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz]]
