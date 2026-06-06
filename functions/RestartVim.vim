vim9script

def g:RestartVim(): void

    execute  "set all&"
    execute  "abclear"
    execute  "mapclear"

    execute "source $MYVIMRC"
    # execute "e" # edit current buffer, to get color highting

enddef


nnoremap <f12> :call g:RestartVim()<CR>
