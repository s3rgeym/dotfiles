call plug#begin('~/.vim/plugged')
" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
" yay -S fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" linting
Plug 'dense-analysis/ale'
" quoting
Plug 'tpope/vim-surround'
" search and replace in files
" yay -S ack
Plug 'mileszs/ack.vim'
" highlight brackets
Plug 'frazrepo/vim-rainbow'
" git helper
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --ts-completer
  endif
endfunction

" autocomplete
" yay -S cmake
Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'preservim/nerdcommenter'
call plug#end()

" use system clipboard
set clipboard+=unnamedplus

" indention
set ts=2 sw=2 sts=2 et

" text search
set hlsearch ignorecase incsearch smartcase

" show line numbers
set relativenumber

" highlight cursor line
set cursorline

let mapleader=" "

" window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F2> :NERDTreeFind<CR>

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" color mode
set termguicolors

" color theme
colorscheme gruvbox
set background=dark

" airline theme
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" NerdTree
let g:NERDTreeMapActivateNode="<F2>"
let g:NERDTreeMapPreview="<F3>"

let g:rainbow_active = 1

" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

nnoremap <leader>d :YcmCompleter GetDoc<CR>
nnoremap <leader>j :YcmCompleter GoTo<CR>
" /YouCompleteMe

" NerdCommenter
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
" /NerdCommenter
