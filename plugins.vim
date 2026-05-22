vim9script


call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

source $MYVIMDIR/pluginsconfigs/fzfconfig.vim
source $MYVIMDIR/pluginsconfigs/cocconfig.vim
