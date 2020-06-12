" отключаем совместимость с Vi
set nocompatible
filetype off

" для управления плагинами используется vim-plug
" :PluggInstall и :PlugUpdate нужно вызывать вручную
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nathanaelkane/vim-indent-guides'
" требует установки cmake
Plug 'valloric/youcompleteme', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

" плагины добавлять сюда

call plug#end()

filetype indent plugin on

"===============================================================================
" Устройства ввода
"===============================================================================

" включаем поддержку мыши
set mouse=a
" отключаем таймаут для маппингов
set notimeout
" таймаут для терминальных клавиш
set ttimeout ttimeoutlen=200


"===============================================================================
" Форматирование
"===============================================================================

" отступы
set autoindent shiftwidth=2 smartindent tabstop=2
set expandtab
set shiftround

" перенос строк
set wrap
set textwidth=80
set wrapmargin=0
"set formatoptions=cqt
set formatoptions=tcqrn1
" разбивать строки по словам, а не по символам
set linebreak


"===============================================================================
" Поиск и замена
"===============================================================================

" подсвечивать результаты поиска
set hlsearch incsearch
" не учитывать регистр при поиске, если символы в одном регистре
set ignorecase smartcase
" добавляет флаг g для замены текста
set gdefault


"===============================================================================
" Рендеринг текста
"===============================================================================

" добавляем визуальный ограничитель = textwidth + 1
" через запятую можно указать несколько значений
set colorcolumn=+1
" выделять текущую строку
set cursorline
" показывать часть строки вместо @ для длинных строк
set display+=lastline
" кодировка по-умолчанию
set encoding=utf-8

" отображать непечатные символы и разрывы строк
set list listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set showbreak=↪\ "

" принудительно не переводить курсор в начало строки
set nostartofline

" прокрутка
set scrolloff=1 sidescroll=5

" подсвечивать парные скобки
set showmatch
set matchpairs+=<:>

" подсветка синтаксиса
syntax enable


"===============================================================================
" Интерфейс
"===============================================================================

" цветовая схема
color molokai
set t_Co=256

" всегда показывать строку состояния
set laststatus=2

" показывать введенную команду
set showcmd
" количество строк, используемых для ввода команды
set cmdheight=2

" показывать номера строк
set number relativenumber
" показывать позицию курсора
set ruler
" показывать текущий режим
set showmode
" показывать варианты дополнения в меню
set wildmenu
set wildmode=longest:full,full

"===============================================================================
" Поведение
"===============================================================================

" менять рабочий каталог на тот, в котором расположен файл
set autochdir
" перечитывать файл при внешнем изменении
set autoread
" поведение при нажатии backspace
set backspace=2 " тоже самое что и indent,eol,start
" показывать диалог при наличии несохраненных изменений
set confirm
" разрешить одновременное редактирование нескольких файлов
set hidden
" отключить звук бипера
set noeb vb t_vb=
" в целях безопасности игнориуем modeline's
set nomodeline
" переводить восьмеричные числа в десятичные при инкременте
set nrformats-=octal
" переходить на другую строку с помощью влево-вправо
set whichwrap+=<,>,h,l,[,]


"===============================================================================
" Производительность
"===============================================================================

set complete-=i
set lazyredraw


"===============================================================================
" Прочее
"===============================================================================

" копировать в системный буфер обмена
set clipboard=unnamed,unnamedplus
" размер истории операций
set history=10000
" символы, входящие в слово
"set iskeyword=@,48-57,_,192-255

"===============================================================================

" восстановить позицию курсора при открытии файла
augroup jump
  au!
  au BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup end

packadd! matchit

" :W сохранить файл с sudo
command W w !sudo tee % > /dev/null

" сочетание gq используется для форматирования
map Q gq

" повторить операцию
nmap U <C-r>

" выбрать целую строку
nmap Y y$

" переключение режима вставки
set nopaste
set pastetoggle=<F2>

" перемещать курсор по видимым строкам, а не физическим
map j gj
map k gk

" перемещение между окнами
nmap <C-j> <c-w>j
nmap <C-k> <c-w>k
nmap <C-h> <c-w>h
nmap <C-l> <c-w>l

" добавление отступов в визуальном режиме
vmap < <gv
vmap > >gv

" выбрать все
map <C-a> <esc>ggVG<cr>

let mapleader = "\<Space>"

" сохранение файлов, закрытие окна
map <leader>w :w<CR>
map <leader>x :x<CR>
map <leader>q :q!<CR>

" закрыть текущий буфер
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" закрыть все буферы
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" работа с вкладками
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tm :tabmove

" разделение экрана
nmap <leader>v :vsplit<cr>
nmap <leader>s :split<cr>

" используется для перезагрузки ~/.vimrc
nmap <leader>so :w<cr>:so %<cr>

nmap <leader>n :NERDTreeToggle<cr>

let g:airline_powerline_fonts = 1
let g:indent_guides_enable_on_vim_startup = 1
