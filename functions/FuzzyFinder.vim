vim9script

var FZF: string = "fzf"
var SEP: string = '\\'
var BASEDIR: string = $MYVIMDIR

if BASEDIR[-1 :] == '\'
    BASEDIR = BASEDIR[: -2]
endif

var TEMP_FILE: string = BASEDIR .. '\temp\filename'
TEMP_FILE = substitute(TEMP_FILE, '\', '/', 'g')

def g:InvokeFinder(): void
    if !executable(FZF)
        echo FZF .. " not installed"
        return
    endif

    var quoted_temp: string = '"' .. TEMP_FILE .. '"'
    execute $':!{FZF} > {quoted_temp}'
    var filename: string = trim(readfile(TEMP_FILE)[0])
    if filename == ""
        return
    endif

    var mode: string = input('> ')
    execute $":{mode} {filename}"


enddef

nnoremap <c-p> :call g:InvokeFinder()<CR>
inoremap <c-p> <esc>:call g:InvokeFinder()<CR>
