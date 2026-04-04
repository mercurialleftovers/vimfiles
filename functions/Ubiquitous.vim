vim9script


def g:Toggle_listchars(): void
    &list = !&list
enddef


def g:ToggleNumber(): void
    &number = !&number
    &relativenumber = !&relativenumber
enddef
