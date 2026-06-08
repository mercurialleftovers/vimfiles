vim9script

# TODO(bader):
# [ ] - how to resolve paths (backslashes) os-agnostically
# [ ] - calling external cli tools (ruff) and executing other commands (edit %) while
# the term running the cli tool is still open causes an error (you need to async dispatch)
var MYPY_CACHE_DIR: string = substitute($"{getenv('HOME')}{g:sep}.mypy_cache", '\', g:sep, 'g')
var RUFF_CACHE_DIR: string = substitute($"{getenv('HOME')}{g:sep}.ruff_cache", '\', g:sep, 'g')

var autoformat: bool = true

def  g:CallMyPyFormatter(): void
	if executable("mypy") == 0
		echo "Mypy is not installed!"
	else
		execute $"term ++shell mypy . --cache-dir {MYPY_CACHE_DIR}"
	endif

enddef

def  g:CallRuffFormatter(): void
	if executable("ruff") == 0
		echo "Ruff is not installed!"
	else
        if findfile("pyproject.toml") == "pyproject.toml"
            if system("cat pyproject.toml | grep 'ruff'") =~ "ruff"
                echo "loading ruff config from pyproject.toml instead ..."
                execute $"term ++shell ruff format % "
            endif
        else
            execute $"term ++shell ruff format % --cache-dir {RUFF_CACHE_DIR}"
        endif
	endif
enddef


def  g:CallRuffFixer(): void
	if executable("ruff") == 0
		echo "Ruff is not installed!"
	else
        if findfile("pyproject.toml") == "pyproject.toml"
            if system("cat pyproject.toml | grep 'ruff'") =~ "ruff"
                echo "loading ruff config from pyproject.toml instead ..."
                execute $"term ++shell ruff check --fix % "
            endif
        else
            execute $"term ++shell ruff check --fix % --cache-dir {RUFF_CACHE_DIR}"
        endif
	endif
enddef


def  g:CallRuffAll(): void
	if executable("ruff") == 0
		echo "Ruff is not installed!"
	else
        if findfile("pyproject.toml") == "pyproject.toml"
            if system("cat pyproject.toml | grep 'ruff'") =~ "ruff"
                echo "loading ruff config from pyproject.toml instead ..."
                execute $"term ++shell ruff format .  && ruff check --fix ."
            endif
        else
            execute $"term ++shell ruff format . && ruff check --fix . --cache-dir {RUFF_CACHE_DIR}"
        endif
	endif
enddef



def g:CallRuffFormatterSilent(): void
    try
        var config_file: string = "pyproject.toml"
        var current_position = winsaveview()
        if executable("ruff") == 0
            echo "Ruff is not installed!"
        else
            var current_file: string = expand("%")
            echo current_file

            if findfile(config_file) == config_file
                if system($"cat {config_file} | grep 'ruff'") =~ "ruff"
                    system($"ruff format {current_file}")
                endif
            endif
            system($"ruff format {current_file} --cache-dir {RUFF_CACHE_DIR}")
        endif
        execute ":write!<enter>"
        winrestview(current_position)
    catch
        echo "error formatting on save!"
    endtry
enddef


def g:ReloadBuffer(): void
    var currentpost = winsaveview()
    execute "edit %"
    winrestview(currentpost)
enddef

nnoremap <c-f5> :call g:ReloadBuffer()<CR>
inoremap <c-f5> <esc>:call g:ReloadBuffer()<CR>
nnoremap <f6> :call g:CallMyPyFormatter()<CR>
inoremap <f6> <ESC>:call g:CallMyPyFormatter()<CR>
nnoremap <f7> :call g:CallRuffFormatter()<CR>
inoremap <f7> <ESC>:call g:CallRuffFormatter()<CR>
nnoremap <f8> :call g:CallRuffFixer()<CR>
inoremap <f8> <ESC>:call g:CallRuffFixer()<CR>
nnoremap <f9> :call g:CallRuffAll()<CR>
inoremap <f9> <ESC>:call g:CallRuffAll()<CR>


# augroup needs to be cleared, otherwise they keep re-registering
# source: https://dev.to/waylonwalker/you-must-use-augroup-with-autocmd-in-vim-heres-how-ig6

nnoremap <f12> :call g:CallRuffFormatterSilent()<CR>
inoremap <f12> <esc> :call g:CallRuffFormatterSilent()<CR>

augroup autoformat
    autocmd!
    autocmd BufWritePost *.py silent! :call g:CallRuffFormatterSilent() | :edit
augroup end
