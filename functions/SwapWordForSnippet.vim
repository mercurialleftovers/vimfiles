vim9script


def g:SwapWordForSnippet(): void
	var entries = json_decode(join(readfile($"{$MYVIMDIR}/snippets/{&filetype}.json"), ""))
	execute "normal viw\"cy" # yank word into the c register
	if entries->has_key(@c)
		 setreg('c', entries[@c], 'c') # the last c for character-wise mode, see :help setreg
		 execute "normal! gv\"cp"
		 execute "normal! /cursor\r" # put cursor on heredoc
	else
		execute "normal <c-n>" # built-in completion
	endif
enddef

nnoremap <c-space> :call g:SwapWordForSnippet()<enter><enter>
inoremap <c-space> <esc>:call g:SwapWordForSnippet()<enter><enter>a
