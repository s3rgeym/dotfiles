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

set autochdir                     " менять рабочий каталог на тот, в котором
                                  " расположен файл

set clipboard=unnamed,unnamedplus " копируем в системный буфер обмена
set cmdheight=3                   " количество строк в меню команд
set colorcolumn=+1                " показывать визуальный ограничитель
set confirm                       " показывать диалог при наличии несохраненных
                                  " изменений

set cursorline                    " выделять текущую строку
set gdefault                      " добавлять флаг /g при замене текста
set hidden                        " разрешить одновременное редактирование
                                  " нескольких файлов

set hlsearch                      " подсвечивать результаты поиска
set ignorecase smartcase          " не учитывать регистр при поиске, если
                                  " символы в одном регистре

set linebreak                     " переносить строки по словам, а не символам
set matchpairs+=<:>               " лучшая поддержка html
set mouse=a                       " включить поддержку мыши
set noeb vb t_vb=                 " отключить звук бипера
set nomodeline                    " в целях безопасности игнорировать
                                  " modeline's

set nopaste                       " отключить режим вставки
set nostartofline                 " принудительно не переводить курсор в начало
                                  " строки

set number relativenumber         " показывать номера строк
set shiftwidth=2 tabstop=2        " отступы
set showbreak=↪                   " показывать разрывы строк
set showmatch                     " подсвечивать парные скобки
set textwidth=79                  " ограничение на длину строки
set whichwrap+=<,>,h,l,[,]        " переходить на новую строку с помощью
                                  " влево-вправо

set wrap                          " включить перенос строк

" восстановление позиции курсора при открытии файла
augroup jump
  au!
  au BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup end

" автоматическая установка плагинов при запуске Vim
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

autocmd FileType html,css,vue,scss EmmetInstall

" :W сохранить файл с sudo
command W w !sudo tee % > /dev/null

" переключение режима вставки
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
