vim9script

var FZF: string = "fzf"
var BASEDIR: string = $MYVIMDIR

# the next if statement (as well as other things) by Claude - Ashamingly said !
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

    var fileContent = readfile(TEMP_FILE)
    if len(fileContent) == 0
        return
    endif

    var filename: string = trim(fileContent[0])
    if filename == ""
        return
    endif

    var mode: string = input('> ')
    execute $":{mode} {filename}"


enddef

nnoremap <c-p> :call g:InvokeFinder()<CR>
inoremap <c-p> <esc>:call g:InvokeFinder()<CR>
