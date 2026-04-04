vim9script

def  g:CallMyPy(): void
	if executable("mypy") == 0
		echo "Mypy is not installed!"
	else
		execute "term ++shell mypy ."
	endif

enddef

def  g:CallRuffFormatter(): void
	if executable("ruff") == 0
		echo "Mypy is not installed!"
	else
		execute "ruff format && ruff check --fix %"
	endif

enddef


def  g:CallRuffFixer(): void
	if executable("ruff") == 0
		echo "Mypy is not installed!"
	else
		execute "ruff check --fix %"
	endif

enddef
