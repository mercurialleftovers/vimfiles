vim9script

# var MYPY_CACHE_DIR: string = "C:\\temp_files"
# TODO(bader): [ ] - how to resolve paths (backslashes) os-agnostically
var MYPY_CACHE_DIR: string = $"{getenv('HOME')}\\.mypy_cache"
var RUFF_CACHE_DIR: string = $"{getenv('HOME')}\\.ruff_cache"
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
        endif
		execute $"term ++shell ruff format % --cache-dir {RUFF_CACHE_DIR}"
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
        endif
		execute $"term ++shell ruff check --fix % --cache-dir {RUFF_CACHE_DIR}"
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
        endif
		execute $"term ++shell ruff format . && ruff check --fix . --cache-dir {RUFF_CACHE_DIR}"
	endif

enddef



def  g:CallRuffFormatterSilent(): void
	if executable("ruff") == 0
		echo "Ruff is not installed!"
	else

        var current_file: string = expand("%")

        if findfile("pyproject.toml") == "pyproject.toml"
            if system("cat pyproject.toml | grep 'ruff'") =~ "ruff"
                system($"ruff format {current_file}")
            endif
        endif
		system($"ruff format {current_file} --cache-dir {RUFF_CACHE_DIR}")
	endif

enddef

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

if autoformat
    augroup format
        autocmd!
        autocmd BufWritePre *.py silent! call CallRuffFormatterSilent() | edit %
    augroup end
endif
