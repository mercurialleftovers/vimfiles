vim9script

# TODO:
# [ ] - term ++shll ruff --fix doesn't trigger autoload!
# [ ] - learn how to mark, and go to mark, use it to make the SwapWordForSnippet go to symbol
# [*] - f1, to show special chars, doesn't return the cursor to its og position
# [ ] - move keymaps with the function they call (more goot comparmentalization, less cognitive effor to maintain where keymaps are vs where respective function is
# [ ] - learn vimregex, and how to do substitutions (patterns, capturing groups etc)
# [ ] - how to manipulate buffers programmatically: line, getline, $, '<, '>, . etc
# [*] - snippet system using SwapWordForSnippet and a $MYVIMDIR/snippets/&filetype folder to read from (maybe json ?)
# [*] - vcs and uploading my vimdir to github
# [ ] - check cursor shape help (future endeavor, not asap)
# [ ] - install a git gui tools such as meld and configure its keymaps <c-g>g !meld .<CR> or <c-g>g :call CallMeld()<CR>
# [ ] - figure out the $ problem in SwapWordForSnippet and the newline problem in json files in the same function
# [ ] - fuzzy finder that uses regex so I can do: templa*\file*.ejs or something and it shows live feedback
# [ ] - make SwapWordForSnippet a dynamic function that matches the regex:
#		- Enum(int, Name) is unpacked to become: class Name(Enum, int):\n or sth, only when a regex is not met, checking the word as an entry is done (the current way)
# [ ] - learn/use augroups
# echo "termmode = " .. &term
# echo "gui_running = " .. has("gui_running")

if $OS == "Windows_NT"
	set runtimepath^=C:\Users\ccc\OneDrive\vimfiles
	$MYVIMDIR = 'C:\Users\ccc\OneDrive\vimfiles'
endif
# var path_to_configs = $MYVIMDIR

# source $"{path_to_configs}/settings.vim" # how to construct "jumpable into" path like with $MYVIMDIR/setings.vim

source $MYVIMDIR/plugins.vim
source $MYVIMDIR/settings.vim
# functions:
source $MYVIMDIR/functions/Ubiquitous.vim
# 
source $MYVIMDIR/functions/ToggleFullScreen.vim
source $MYVIMDIR/functions/RunSnippet.vim
source $MYVIMDIR/functions/RunCurrentFile.vim
source $MYVIMDIR/functions/ToggleHotReload.vim
source $MYVIMDIR/functions/SwapWordForSnippet.vim
source $MYVIMDIR/functions/CommentLine.vim
source $MYVIMDIR/functions/ToggleHotReload.vim
source $MYVIMDIR/functions/TerminalInputMode.vim
source $MYVIMDIR/functions/WebSearch.vim
# source $MYVIMDIR/functions/MoveSelection.vim

augroup python
	autocmd!
	autocmd filetype python source $MYVIMDIR/functions/PythonLinters.vim
augroup end

# autocmd filetype python :vim9 echo $"opened a python file!"
# source $MYVIMDIR/functions/TabEnterToggleTerminalInputMode.vim
source $MYVIMDIR/keymaps.vim
source $MYVIMDIR/git.vim
# quick cursor-shape fix that I don't comprehend as of now
if &term == "win32"
	source $MYVIMDIR/cursor.vim
endif
# autocm BufWritePost * call g:HotReload()
# autocmd TabEnter * :call TabEnterToggleTerminalInputMode()<CR>
