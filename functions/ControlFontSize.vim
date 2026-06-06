vim9script


var SIZE_PLACEHOLDER = 'FONT_SIZE_PLACEHOLDER'
var default_font = &guifont


def g:IncreaseFont(op: string): void
    var size: number = str2nr(matchstr(&guifont, '\d\+'))
    var font_schema = substitute(&guifont, '\d\+', SIZE_PLACEHOLDER, '')

    if op == '+'
        size += 1
    elseif op == '-'
        size -= 1
    # elseif op == 'r' reset
        echo $"font_size: {size}"
        &guifont = default_font
        return
    endif

    var font: string = substitute(font_schema, SIZE_PLACEHOLDER, size, '')
    &guifont = font
enddef


nnoremap + :call g:IncreaseFont('+')<CR>
nnoremap - :call g:IncreaseFont('-')<CR>
nnoremap _ :call g:IncreaseFont('-')<CR>
nnoremap = :call g:IncreaseFont('r')<CR>
