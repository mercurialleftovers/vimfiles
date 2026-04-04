vim9script


def g:MoveSelection2(direction: string): void # direction: Enum{up, down}
	# echo $"moving line {line('.')}: " .. getline("'<") .. direction
	if direction == "down"
		if line("'>") == line("$")
			echo "line is last!"
			execute "normal Go"
			execute "normal! :w<CR>"
			call g:MoveSelection(direction)
			return
		else
			# execute ":m '>+1<CR>gv="
			execute ":m .+1<CR>gv="
		endif
	else
		if line("'<") == 1
			echo "line is first!"
			execute "normal ggO"
			execute "normal! :w<CR>"
			call g:MoveSelection(direction)
			return
		else
			# execute ":m '<-2<CR>gv="
			execute ":m .-2<CR>gv="
		endif
	endif
enddef

def g:MoveSelection(direction: string): void # direction: Enum{up, down}
	if direction == "down"
		execute ":m .+1<CR>gv="
	else
		execute ":m .-2<CR>gv=" # TODO(bader): this way, things are flipped because each line is moved to the next, making it the next "next" line to be moved
	endif
enddef

def g:VisualMode(): void
	echo $"{line('.')}, " .. line("'<") .. ", " .. line("'>")
enddef
