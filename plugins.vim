vim9script


call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

source $MYVIMDIR/pluginsconfigs/fzfconfig.vim
