-- Эти настройки будут применены до загрузки init.lua
-- Клавишу leader надо объявить до загрузки плагинов
vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.fn.has("termguicolors") == 1 then
  -- Некоторые плагины могут неправильно работать, если не установить это значение
  vim.opt.termguicolors = true
end

local options = {
  -- Interface
  number = true, -- Show absolute line numbers
  relativenumber = true,
  cursorline = true, -- Highlight the line under the cursor
  signcolumn = "yes", -- Always show sign column
  laststatus = 3, -- Always display the status line
  showmode = false, -- Do not show current mode
  termguicolors = true, -- Enable 24-bit colors

  -- Cursor and scrolling
  scrolloff = 8, -- Context lines above/below cursor
  sidescrolloff = 8, -- Context columns left/right
  whichwrap = "h,l,<,>,[,]", -- Allow cursor to wrap across lines
  mouse = "a", -- Enable mouse support

  -- Text wrapping
  wrap = true, -- Enable visual line wrapping
  linebreak = true, -- Wrap at word boundaries
  breakindent = true, -- Keep indentation on wrapped lines
  showbreak = "↪ ", -- Mark wrapped line continuation

  -- Text editing
  expandtab = true, -- Use spaces instead of tabs
  tabstop = 4, -- Visual tab width
  shiftwidth = 2, -- Indent width
  softtabstop = 2, -- Insert/delete spaces with Tab
  smarttab = true, -- Tab respects shiftwidth at line start
  autoindent = true, -- Copy indent from previous line
  smartindent = true, -- Smart indent for C-like code
  --opt.joinspaces = false, -- One space after sentence join
  textwidth = 80, -- Preferred line length
  -- Не имеет эффекта в арче, так как устанавливается через плагины после загрузки
  -- init.lua
  -- formatoptions = { j = true, q = true },
  -- Invisible characters
  list = true,
  listchars = {
    tab = "→ ",
    trail = "·",
    nbsp = "␣",
  },

  -- Search
  ignorecase = true, -- Case-insensitive search
  smartcase = true, -- Case-sensitive if uppercase used
  hlsearch = true, -- Highlight search matches
  incsearch = true, -- Incremental search
  inccommand = "split", -- Live substitute preview

  -- Wildmenu
  wildignorecase = true, -- Ignore case in command line
  wildignore = {
    "*/.git/*",
    "*/node_modules/*",
  },

  -- Completion
  completeopt = { "menu", "menuone", "noselect" },
  backspace = { "indent", "eol", "start" },

  -- Files and buffers
  clipboard = "unnamedplus", -- Use system clipboard
  swapfile = false, -- Disable swap files
  backup = false, -- Disable backup files
  undofile = true, -- Persistent undo
  hidden = true, -- Allow buffer switching without saving
  autoread = true, -- Reload files changed externally
  confirm = true, -- Confirm before losing changes
  -- Disables configuration lines inside text files (modelines).
  -- Although often off by default in some distributions,
  -- explicitly setting it to false prevents potential shell command injection.
  modeline = false,

  -- Session and Shada
  -- Options are not saved in sessions to avoid plugin conflicts
  sessionoptions = "buffers,curdir,tabpages,winsize,help,folds,localoptions",
  -- Shada files store cursor position, marks, and registers
  shada = "!,'100,<1000,s10,h",

  -- Windows
  splitbelow = true, -- Horizontal splits open below
  splitright = true, -- Vertical splits open right

  -- Performance
  updatetime = 200, -- Faster CursorHold / diagnostics
  timeoutlen = 500, -- Key sequence timeout

  -- Russian keyboard layout
  -- Use <c-^> (Ctrl-6) to toggle internal keymap
  keymap = "russian-jcukenwin",
  iminsert = 0,
  imsearch = -1,

  -- Keep shortcuts working when switching layouts
  langmap = [[ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz]],

  conceallevel = 0, -- Show concealed text
}

for option, value in pairs(options) do
  vim.opt[option] = value
end
