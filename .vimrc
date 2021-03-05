call plug#begin('~/.vim/plugged')
" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" My plugins
Plug 'tpope/vim-sensible'
call plug#end()
