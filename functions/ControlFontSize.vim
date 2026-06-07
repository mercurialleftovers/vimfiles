vim9script


var SIZE_PLACEHOLDER = 'FONT_SIZE_PLACEHOLDER'
var default_font = &guifont


def g:IncreaseFont(inc: number): void
    var size: number = str2nr(matchstr(&guifont, '\d\+'))
    var font_schema = substitute(&guifont, '\d\+', SIZE_PLACEHOLDER, '')

    if inc == 0
        echo $"font_size: {size}"
        &guifont = default_font
        return
    endif

    size += inc
    echo $"font_size: {size}"

    var font: string = substitute(font_schema, SIZE_PLACEHOLDER, size, '')
    &guifont = font
enddef


nnoremap + :call g:IncreaseFont(1)<CR>
nnoremap - :call g:IncreaseFont(-1)<CR>
nnoremap _ :call g:IncreaseFont(-1)<CR>
nnoremap = :call g:IncreaseFont(0)<CR>
