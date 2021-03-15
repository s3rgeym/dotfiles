autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible' " https://github.com/tpope/vim-sensible
Plug 'morhetz/gruvbox' " https://github.com/morhetz/gruvbox
Plug 'joshdick/onedark.vim' " https://github.com/joshdick/onedark.vim

Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes' " https://github.com/vim-airline/vim-airline-themes
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
let g:airline#extensions#ale#enabled = 1

Plug 'preservim/nerdtree' " https://github.com/preservim/nerdtree
Plug 'tpope/vim-surround' " https://github.com/tpope/vim-surround

Plug 'frazrepo/vim-rainbow' " https://github.com/frazrepo/vim-rainbow
let g:rainbow_active = 1

Plug 'preservim/nerdcommenter' " https://github.com/preservim/nerdcommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" requires fzf, ripgrep, the_silver_searcher
Plug 'junegunn/fzf' " https://github.com/junegunn/fzf
Plug 'junegunn/fzf.vim' " https://github.com/junegunn/fzf.vim

" requires eslint, prettier, python-black, python-isort, python-language-server
Plug 'dense-analysis/ale' " https://github.com/dense-analysis/ale
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pyls'],
\}

let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'python': ['isort', 'black']
\}

let g:ale_python_black_options= '--line-length 79'

Plug 'tpope/vim-fugitive' " https://github.com/tpope/vim-fugitive
Plug 'airblade/vim-gitgutter' " https://github.com/airblade/vim-gitgutter
Plug 'editorconfig/editorconfig-vim' " https://github.com/editorconfig/editorconfig-vim
call plug#end()

set et sts=2 sw=2 ts=2
set ignorecase smartcase
set rnu
set cc=80,100,120
set cursorline
set noshowmode
set clipboard=unnamedplus

" set nomodeline

" set nobackup
" set noswapfile
" set noundofile

"set t_Co=256
color onedark
set background=dark

let mapleader = " "
nnoremap <Space> <Nop>

" selecr all
nnoremap <Leader>a ggVG

" save file
nnoremap <Leader>w :w<CR>

" quit
nnoremap <Leader>q :q<CR>

" navigation between splits
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" buffers
nnoremap <Leader>p :bp<CR> " prev
nnoremap <Leader>n :bn<CR> " next
nnoremap <Leader>d :bd<CR> " delete

" splitting
nnoremap <Leader>h :split<CR> " horizontal
nnoremap <Leader>v :vsplit<CR> " vertical

" run current file
nnoremap <Leader>r :!%:p


" vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR> " edit
nnoremap <Leader>sv :so $MYVIMRC<CR> " source

" file tree
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>

" fzf
nnoremap <silent> <Leader>f :Files<CR> " search files by name
nnoremap <silent> <Leader>b :Buffers<CR> " search in buffers
nnoremap <silent> <Leader>g :Ag<CR> " search by content
