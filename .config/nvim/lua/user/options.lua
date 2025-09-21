local opt = vim.opt

-- Нумерация строк
opt.number = true
-- opt.relativenumber = true

-- Подсветка текущей строки
opt.cursorline = true

-- Прокрутка
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Отображение элементов интерфейса
opt.signcolumn = "yes"
opt.laststatus = 2
-- Только при использовании statusline
-- opt.showmode = false
opt.shortmess:append("I")

-- Перенос строк
opt.linebreak = true

-- Отображение различных символов
opt.list = true
opt.listchars = {
  tab = '→ ',
  lead = '·',
  trail = '·',
  nbsp = '␣',
  extends = '⟩',
  precedes = '⟨',
}

-- Отступы и форматирование
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.textwidth = 80
opt.colorcolumn = "+1"
opt.formatoptions = {
  c = true,
  q = true,
  j = true,
  r = true,
  n = true,
  l = true,
}

-- Максимальный размер строки для подсветки
opt.synmaxcol = 1024

-- Поиск
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Файлы и буферы
opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.autoread = true
opt.undofile = true
opt.undolevels = 1000
-- opt.shada = "!,'1000,<50,s10,h"
opt.confirm = true

-- Разделение окон
opt.splitbelow = true
opt.splitright = true

-- Фолдинг
opt.foldmethod = "expr"
opt.foldlevelstart = 99
opt.foldenable = true

-- Мышь, перемещение курсора и выделение текста
opt.mouse = "a"
opt.mousemoveevent = true
opt.whichwrap = 'h,l,<,>,[,]'
-- opt.keymodel = "startsel,stopsel"

-- В vim есть встроенная поддержка русской раскладки. Мы можем переключаться на нее и обратно с помощью Ctrl-6, при этом при включенной русской, связки клавиш продолжат работать.
opt.keymap = "russian-jcukenwin"
opt.iminsert = 0
opt.imsearch = 0

-- Автодополнение
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore:append {
  '*.o',
  '*.obj',
  '*.pyc',
  '*.so',
  '.git',
  '.svn',
  '__pycache__',
}

-- Сессии
opt.sessionoptions:append("localoptions")

-- Таймауты
opt.timeoutlen = 500
opt.updatetime = 200

-- Тема
vim.cmd.colorscheme [[catppuccin-macchiato]]
