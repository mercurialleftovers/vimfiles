nnoremap <c,\/> :call g:ToggleCommented()<CR>
inoremap <c,\/> <esc>:call g:ToggleCommented()<CR>
vnoremap <c,\/> :call g:ToggleCommented()<CR>

var commentSigns: dict<string, string> = {}

def g:ToggleCommented(): void
	if !commentSigns->has_key(&filetype)
		return
	endif

	var commentSign: string = commentSigns[&filetype] 
	var commentedPattern: string = $"{commentSign}\\s*.*"
	var beginsWithCommentPattern = $"\s*{commentSign}\s*"

	if getline('.') =^ beginsWithCommentPattern
		echo $"uncommenting line {line('.')}"
		var capturedGroupPattern = $"{beginsWithCommentPattern}\{.\+\}" # the {.\+} is the captured part
		call "normal :s/captruedGroupPattern/capturedGroupAlias"
	else
		echo $"commenting line {line('.')}"
		call "normal s/{pattern}/{commentSign} &"
	endif
enddef