vim9script

# TODO:
# [ ] - learn vimregex
# [ ] - how to manipulate buffers programmatically: line, getline, $, '<, '>, . etc
# [ ] - snippet system using SwapWordForSnippet and a $MYVIMDIR/snippets/&filetype folder to read from (maybe json ?)
# [ ] - vcs and uploading my vimdir to github
# [ ] - check cursor shape help (future endeavor, not asap)
# [ ] - install a git gui tools such as meld and configure its keymaps <c-g>g !meld .<CR> or <c-g>g :call CallMeld()<CR>
# [ ] - figure out the $ problem in SwapWordForSnippet and the newline problem in json files in the same function
# [ ] - fuzzy finder that uses regex so I can do: templa*\file*.ejs or something and it shows live feedback
# [ ] - make SwapWordForSnippet a dynamic function that matches the regex:
#		- Enum(int, Name) is unpacked to become: class Name(Enum, int):\n or sth, only when a regex is not met, checking the word as an entry is done (the current way)
# [ ] - learn/use augroups

source $MYVIMDIR/settings.vim
# functions:
source $MYVIMDIR/functions/Ubiquitous.vim

source $MYVIMDIR/functions/ToggleFullScreen.vim
source $MYVIMDIR/functions/RunSnippet.vim
source $MYVIMDIR/functions/RunCurrentFile.vim
source $MYVIMDIR/functions/ToggleHotReload.vim
source $MYVIMDIR/functions/SwapWordForSnippet.vim
source $MYVIMDIR/functions/CommentLine.vim
source $MYVIMDIR/functions/ToggleHotReload.vim
source $MYVIMDIR/functions/PythonLinters.vim
source $MYVIMDIR/functions/MoveSelection.vim
# source $MYVIMDIR/functions/TabEnterToggleTerminalInputMode.vim
#
source $MYVIMDIR/keymaps.vim
source $MYVIMDIR/git.vim
# quick cursor-shape fix that I don't comprehend as of now
if &term == "win32"
	source $MYVIMDIR/cursor.vim
endif

# autocm BufWritePost * call g:HotReload()
# autocmd TabEnter * :call TabEnterToggleTerminalInputMode()<CR>
