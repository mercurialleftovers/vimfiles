vim9script


def g:TerminalInputMode(): void
    var buffername: string = &term == "win32" ? "cmd.exe" : "!/bin/bash"

    if bufname() =~ "cmd.exe"
		try
			execute "normal i" # TODO(bader): it is windows only as of now
		catch
			# "not modifiable"
			# echo "not modifiable error fired!"
		endtry
	endif
enddef

autocmd BufEnter *cmd.exe* :call g:TerminalInputMode()
