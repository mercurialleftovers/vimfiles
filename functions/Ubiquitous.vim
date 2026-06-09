vim9script


def g:Toggle_listchars(): void
    &list = !&list
enddef

def g:ToggleNumber(): void
    &number = !&number
    &relativenumber = !&relativenumber
enddef

nnoremap <f1> :call g:Toggle_listchars()<enter>
vnoremap <f1> <esc>:call g:Toggle_listchars()<enter>
inoremap <f1> <esc>:call g:Toggle_listchars()<enter>i

vnoremap <f2> <esc>:call g:ToggleNumber()<enter>
inoremap <f2> <esc>:call g:ToggleNumber()<enter>
nnoremap <f2> :call g:ToggleNumber()<enter>
