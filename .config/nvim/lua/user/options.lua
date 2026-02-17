local opt = vim.opt

-- Interface
opt.number = true -- Show absolute line numbers
opt.cursorline = true -- Highlight the line under the cursor
opt.signcolumn = "yes" -- Always show sign column
opt.laststatus = 3 -- Always display the status line
opt.showmode = false -- Do not show current mode
opt.shortmess:append("I") -- Skip startup intro
opt.colorcolumn = "+1" -- Column right after textwidth
opt.termguicolors = true -- Enable 24-bit colors
opt.fillchars:append({ eob = " " }) -- Remove "~" at the end of the file

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
opt.textwidth = 80 -- Preferred line length
--opt.joinspaces = false -- One space after sentence join
opt.formatoptions:remove({ "t", "c" })

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

-- Session and Shada
-- Global options are not saved in sessions to avoid plugin conflicts
opt.sessionoptions =
  "buffers,curdir,folds,help,tabpages,winsize,terminal,localoptions"
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

-- UI Appearance & Styling
local hl = vim.api.nvim_set_hl

local transparent_groups = {
  "Normal",
  "NormalNC",
  "SignColumn",
  "EndOfBuffer",
  "LineNr",
  "FoldColumn",
}

for _, group in ipairs(transparent_groups) do
  hl(0, group, { bg = "none" })
end

-- Italic
hl(0, "Comment", { italic = true })
hl(0, "@comment", { italic = true })

-- Bold
hl(0, "Keyword", { bold = true })
hl(0, "Statement", { bold = true })
hl(0, "Function", { bold = true })

-- Bold Italic (Accents)
hl(0, "Todo", { bold = true, italic = true })
