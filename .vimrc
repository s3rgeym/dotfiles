autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'liuchengxu/vim-better-default' " https://github.com/liuchengxu/vim-better-default

Plug 'tpope/vim-surround' " https://github.com/tpope/vim-surround

Plug 'joshdick/onedark.vim' " https://github.com/joshdick/onedark.vim

Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes' " https://github.com/vim-airline/vim-airline-themes
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_theme='onedark'
  let g:airline#extensions#ale#enabled = 1

Plug 'editorconfig/editorconfig-vim' " https://github.com/editorconfig/editorconfig-vim

" yay -S nnn
Plug 'mcchrish/nnn.vim' " https://github.com/mcchrish/nnn.vim

" yay -S fzf ripgrep
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " https://github.com/junegunn/fzf.vim

  nnoremap <silent> <C-f> :Files<CR>
  nnoremap <silent> <C-g> :Rg<CR>

Plug 'frazrepo/vim-rainbow' " https://github.com/frazrepo/vim-rainbow
  let g:rainbow_active = 1

Plug 'airblade/vim-gitgutter' " https://github.com/airblade/vim-gitgutter

Plug 'preservim/nerdcommenter' " https://github.com/preservim/nerdcommenter

Plug 'dense-analysis/ale' " https://github.com/dense-analysis/ale
  set omnifunc=ale#completion#OmniFunc
  let g:ale_completion_enabled = 1
  let g:ale_completion_autoimport = 1
  let g:ale_fix_on_save = 1

" yay -S python-language-server python-black eslint
  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'python': ['pyls']
  \}

  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['eslint'],
  \   'python': ['black']
  \ }

call plug#end()

" Full color theme support
set termguicolors

" Theme
colorscheme onedark

nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" execute current file
nnoremap <leader>r :!%:p
