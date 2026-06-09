vim9script

# TODO(bader):
# [ ] - how to resolve paths (backslashes) os-agnostically
# [ ] - calling external cli tools (ruff) and executing other commands (edit %) while
# the term running the cli tool is still open causes an error (you need to async dispatch)
var MYPY_CACHE_DIR: string = substitute($"{getenv('HOME')}{g:sep}.mypy_cache", '\', g:sep, 'g')
var RUFF_CACHE_DIR: string = substitute($"{getenv('HOME')}{g:sep}.ruff_cache", '\', g:sep, 'g')

# var autoformat: bool = true

def g:CallRuffFormatterSilent(): void
    try
        var config_file: string = "pyproject.toml"
        var current_position = winsaveview()
        if executable("ruff") == 0
            echo "Ruff is not installed!"
        else
            var current_file: string = expand("%")
            echo current_file
            system($"ruff format {current_file} --cache-dir {RUFF_CACHE_DIR}")
        endif
        execute ":write!<enter>"
        winrestview(current_position)
    catch
        echo "error formatting on save!"
    endtry
enddef


def g:MypyCheck(): void
    if executable("mypy") == 0
        echo "mypy is not installed!"
        return
    endif

    echo $"mypy format . --cache-dir {MYPY_CACHE_DIR}"
    execute $"term ++shell mypy . --cache-dir {MYPY_CACHE_DIR}"
enddef


nnoremap <f6> :call g:MypyCheck()<CR>
inoremap <f6> <ESC>:call g:MypyCheck()<CR>


# augroup needs to be cleared, otherwise they keep re-registering
# source: https://dev.to/waylonwalker/you-must-use-augroup-with-autocmd-in-vim-heres-how-ig6

augroup autoformat
    autocmd!
    autocmd BufWritePost *.py silent! :call g:CallRuffFormatterSilent() | :edit
augroup end
