set nocompatible
filetype off

" :PlugUpdate для обновления плагинов, :PlugClean ‒ для удаления неиспользуемых
call plug#begin('~/.vim/plugged')
" задает минимальные настройки
Plug 'tpope/vim-sensible'

Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround' " оборачивает слова кавычками, тегами и т.д.
Plug 'valloric/youcompleteme', { 'do': './install.py' } " требует cmake
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/taglist.vim' " требует ctags

call plug#end()

" цветовая схема
color molokai

" менять рабочий каталог на тот, в котором расположен файл
set autochdir
" использовать для копирования системный буфер
set clipboard=unnamed,unnamedplus
" количество строк для ввода команд
set cmdheight=2
" показывать визуальный ограничитель
set colorcolumn=+1
" спрашивать действие при наличии несохраненных изменений
set confirm
" выделять текущую строку
set cursorline
" вставлять пробелы при нажатии на Tab
set expandtab
" добавлять флаг /g при замене текста
set gdefault
" разрешить одновременное редактирование нескольких файлов
set hidden
" подсвечивать результаты поиска
set hlsearch
" не учитывать регистр при поиске
set ignorecase
" переносить строки по словам, а не символам
set linebreak
" показывать непечатные символы
set list listchars=tab:→\ ,nbsp:␣,trail:•,precedes:«,extends:»
"считать угловые скобки парными символами
set matchpairs+=<:>
" включить поддержку мыши
set mouse=a
" отключить резервное копирование
set nobackup nowritebackup
" отключить бипер
set noeb vb t_vb=
" в целях безопасности игнорировать modeline's
set nomodeline
" отключить режим вставки
set nopaste
" принудительно не переводить курсор в начало строки
set nostartofline
" не создавать файлы подкачки
set noswapfile
" показывать номера строк
set number
" показывать номера относительно текущей строки
set relativenumber
" округлять отступы при шифтинге
set shiftround
" показывать разрывы строк
set showbreak=↪ "
" подсвечивать парные символы
set showmatch
" учитывать регистр, если строка для поиска содержит символы в разном регистре
set smartcase
" установить размер отступа
set sw=2 ts=2
" длина строки
set textwidth=79
" изменять заголовок окна
set title
" переходить на новую строку с помощью влево-вправо
set whichwrap+=<,>,h,l,[,]
" включить перенос строк
set wrap

" восстановление позиции курсора при открытии файла
augroup RestoreCurPos
  au!
  au BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup end

" автоматическая установка плагинов при запуске Vim
augroup AutoInstall
  au!
  au VimEnter *
    \ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \ |   PlugInstall --sync | q
    \ | endif
augroup end

augroup NERDTree
  au!
  " запускаем NERDTree открытии каталога
  au StdinReadPre * let s:std_in=1
  au VimEnter *
    \ if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
    \ |   exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0]
    \ | endif
augroup end

augroup FileTYpes
  " запуск Emmet
  au FileType html,css,vue,scss EmmetInstall
augroup end

" :W сохранить файл с sudo
command W w !sudo tee % > /dev/null

" режима вставки
set pastetoggle=<f2>

" переключение режима переноса строк
map <f3> :set wrap!<cr>
" навигация по коду
map <f4> :TagbarToggle<cr>
" выполнить текущий файл
map <f5> :!%:p<cr>
" выбрать все
map <c-a> <esc>ggVG<cr>
" сочетание gq используется для форматирования
map Q gq
" повторить операцию
nmap U <c-r>
" выбрать целую строку
nmap Y y$

" перемещать курсор по видимым строкам
map j gj
map k gk

" быстрое перемещение между окнами
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

" добавление отступов в визуальном режиме
vmap < <gv
vmap > >gv

let mapleader = " "

" принудительное закрытие
nmap <leader>q :q!<cr>
" сохранить изменения
nmap <leader>w :w<cr>
" сохранить и закрыть
nmap <leader>x :x<cr>

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

" настройки для syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
