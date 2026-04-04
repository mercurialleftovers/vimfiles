vim9script

#---------------------------------------
nnoremap <c-s> :w<enter>
nnoremap <c-c> yy
nnoremap <c-v> p
nnoremap <c-x> dd
#---------------------------------------
vnoremap <c-s> <esc>:w<enter>
# TODO(bader): needed for block selection
# vnoremap <c-v> pvnoremap <c-c> y
vnoremap <c-x> x
#---------------------------------------
inoremap <c-s> <esc>:w<enter>
inoremap <c-c> <esc>yy
inoremap <c-d> <esc>yyp
inoremap <c-v> <esc>p
inoremap <c-x> <esc>dd
#---------------------------------------
nnoremap <f1> :call g:Toggle_listchars()<enter>
vnoremap <f1> <esc>:call g:Toggle_listchars()<enter>
inoremap <f1> <esc>:call g:Toggle_listchars()<enter>i
#---------------------------------------
nnoremap <silent> <f5> :call g:Run_current_file()<enter>
inoremap <silent> <f5> <esc>:call g:Run_current_file()<enter><enter>
vnoremap <silent> <s-Cr> :<c-w>call g:RunSnippet()<enter>
vnoremap <silent> <f5> :call g:RunSnippet()<enter>
#---------------------------------------
# autocmd BufNewFile,BufRead requirements.txt set ft=python
# autocmd BufNewFile,BufRead *.* set ft=md
autocmd FileType python source $MYVIMDIR/python_keymaps.vim
#---------------------------------------
# vscode ctrl-d function:
# 1- follow the word under the cursor
vnoremap <c-f> *
nnoremap <c-f> viw"cygv
inoremap <c-f> <esc>viw"cygv
# 2- now do the swapping logic:
vnoremap <c-d> <esc>:s/

def g:ReplaceWordWith(): void
	var newWord: string = input($"change {@c} with: ")
	var cmd: string = $":s/{@c}/{newWord}"
	execute cmd
enddef

vnoremap f <c-w>:call g:ReplaceWordWith()<CR>

# bader is bader
# todo:
# figure out if * does save the word to a register
# figure out how to yank to the normal mode command field, the one after the colon (:)
#---------------------------------------
# todo: templates
# nnoremap :templ_py 

# lex
vnoremap <c-b> <esc>:Lex 10<enter>
nnoremap <c-b> :Lex 10<enter>
inoremap <c-b> <esc>Lex 10<enter>

# windows stuff
vnoremap <c-h> <esc><c-w>h
inoremap <c-h> <esc><c-w>h
nnoremap <c-h> <c-w>h

vnoremap <c-j> <esc><c-w>j
inoremap <c-j> <esc><c-w>j
nnoremap <c-j> <c-w>j

vnoremap <c-k> <esc><c-w>k
inoremap <c-k> <esc><c-w>k
nnoremap <c-k> <c-w>k

vnoremap <c-l> <esc><c-w>l
inoremap <c-l> <esc><c-w>l
nnoremap <c-l> <c-w>l

# windows movement
var problem: bool = true
if !problem
	vnoremap <c-h> <esc><c-w>
	inoremap <c-h> <esc><c-w>
	nnoremap <c-h> <c-w><s-w>

	vnoremap <c-j> <esc><c-j>
	inoremap <c-j> <esc><c-j>
	nnoremap <c-j> <c-j>

	vnoremap <c-k> <esc><c-k>
	inoremap <c-k> <esc><c-k>
	nnoremap <c-k> <c-k>

	vnoremap <c-l> <esc><c-l>
	inoremap <c-l> <esc><c-l>
	nnoremap <c-l> <c-l>
endif
#-----------------------------------------

vnoremap <f11> <esc>:call g:togglefullscreen()<enter>
inoremap <f11> <esc>:call g:togglefullscreen()<enter>
nnoremap <f11> :call g:togglefullscreen()<enter>

# emacs-like c-a and c-e
vnoremap <c-a> ^
vnoremap <c-e> $
nnoremap <c-e> $
nnoremap <c-a> ^
inoremap <c-a> <esc>^i
inoremap <c-e> <esc>$a
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-v> <c-r>+
# emacs-like ctrl-o
inoremap <c-o> <esc>:w<enter>a
# ctrl-space for autocompletion
inoremap <c-space> <c-n>
# tab to toggle fold in normal mode
nnoremap <tab> za
# tab to indent in visual mode
vnoremap <tab> >gv
vnoremap <s-tab> <gv
# vnoremap > >gv
# vnoremap < <gv
# ctrl-delete
inoremap <c-bs> <esc>diwa
# move line up and down todo(bader): understand how they work:
# meaning: move selection ('<) -2 lines, reselect (gv), tabulate (=), reselect again(gv)

# easily move using c-h and cl # NOTE(bader): shortcuts already taken
# nnoremap <c-h> b
# nnoremap <c-l> e

vnoremap <f12> :call g:VisualMode()<CR>

# NOTE(bader): this didn't work! fix in the future
vnoremap J :call g:MoveSelection("down")<CR>gv
vnoremap K :call g:MoveSelection("up")<CR>gv
nnoremap J V:call g:MoveSelection("down")<CR>gv
nnoremap K V:call g:MoveSelection("up")<CR>gv
# NOTE(bader): this worked when I switched <enter> with <CR>
vnoremap J :m '>+1<CR>gv=gv 
vnoremap K :m '<-2<CR>gv=gv
nnoremap J V:m '>+1<CR>gv=gv
nnoremap K V:m '<-2<CR>gv=gv
# some function calls
vnoremap <f2> <esc>:call g:ToggleNumber()<enter>
inoremap <f2> <esc>:call g:ToggleNumber()<enter>
nnoremap <f2> :call g:ToggleNumber()<enter>

vnoremap <f9> <esc>:call g:ToggleHotReload()<enter>
inoremap <f9> <esc>:call g:ToggleHotReload()<enter>
nnoremap <f9> :call g:ToggleHotReload()<enter>

nnoremap <f9> :silent call system("explorer")<enter>
nnoremap <f10> :call system("explorer")<enter>
nnoremap <c-space> :call g:SwapWordForSnippet()<enter><enter>
inoremap <c-space> <esc>:call g:SwapWordForSnippet()<enter><enter>a

nnoremap <f12> :call g:CommentLine()<enter>
# terminal stuff
# tnoremap mapping -----------------------
def g:CopyIntoTerminal(): void
	execute $"normal! i{@+}"
enddef

tnoremap <esc> <enter><c-w>N
tnoremap <c-enter> <enter><c-w>N:q!<enter>
tnoremap <c-v> <enter><c-w>N:call CopyIntoTerminal()<enter>
tnoremap <c-h> <c-w>N<c-w>h
tnoremap <c-j> <c-w>N<c-w>j
tnoremap <c-k> <c-w>N<c-w>k
tnoremap <c-l> <c-w>N<c-w>l
# ----------------------------------------
nnoremap <c-t> :tabnew<enter>
inoremap <c-t> :tabnew<enter>
vnoremap <c-t> :tabnew<enter>
# ----------------------------------------
nnoremap <c-enter> :term<enter>
inoremap <c-enter> :term<enter>
vnoremap <c-enter> :term<enter>
# ----------------------------------------
# c-q
nnoremap <c-q> :q<enter>
inoremap <c-q> <esc>:q<enter>
vnoremap <c-q> :q<enter>
# joining current line with the one below
nnoremap J mzJ`z # TODO(bader): learn how
# ----------------------------------------
# -- tabs --------------------------------
nnoremap <silent> <a-h> :tabprevious<enter>
nnoremap <silent> <a-l> :tabnext<enter>
inoremap <silent> <a-h> <esc>:tabprevious<enter>
inoremap <silent> <a-l> <esc>:tabnext<enter>
vnoremap <silent> <a-h> :tabprevious<enter>
vnoremap <silent> <a-l> :tabnext<enter>
nnoremap <silent> <c-PgUp> :tabprevious<enter>
nnoremap <silent> <c-PgDown> :tabnext<enter>
inoremap <silent> <c-PgUp> <esc>:tabprevious<enter>
inoremap <silent> <c-PgDown> <esc>:tabnext<enter>
vnoremap <silent> <c-PgUp> :tabprevious<enter>
vnoremap <silent> <c-PgDown> :tabnext<enter>

tnoremap <silent> <a-h> <enter><c-w>N:tabprevious<enter>
tnoremap <silent> <a-l> <enter><c-w>N:tabnext<enter>
tnoremap <silent> <c-PgDown> <enter><c-w>N:tabnext<enter>
tnoremap <silent> <c-PgUp> <enter><c-w>N:tabprevious<enter>


nnoremap <silent> <a-s-h> :tabm -1<enter>
nnoremap <silent> <a-s-l> :tabm +1<enter>
inoremap <silent> <a-s-h> <esc>:tabm -1<enter>
inoremap <silent> <a-s-l> <esc>:tabm +1<enter>
vnoremap <silent> <a-s-h> :tabm -1<enter>
nnoremap <silent> <c-s-PgUp> :tabm -1<enter>
vnoremap <silent> <a-s-l> :tabm +1<enter>
nnoremap <silent> <c-s-PgDown> :tabm 1<enter>
inoremap <silent> <c-s-PgUp> <esc>:tabm -1<enter>
inoremap <silent> <c-s-PgDown> <esc>:tabm +1<enter>
vnoremap <silent> <c-s-PgUp> :tabm -1<enter>
vnoremap <silent> <c-s-PgDown> :tabm +1<enter>

tnoremap <silent> <a-s-h> <enter><c-s-w>N:tabm -1<enter>
tnoremap <silent> <a-s-l> <enter><c-s-w>N:tabm +1<enter>
tnoremap <silent> <c-s-PgDown> <enter><c-w>N:tabm +1<enter>
tnoremap <silent> <c-s-PgUp> <enter><c-w>N:tabm -1<enter>

def g:TerminalInputMode(): void
	if bufname() =~ "cmd.exe"
		try
			execute "normal i" # TODO(bader): it is windows only as of now
		catch
			# "not modifiable"
			# echo "not modifiable error fired!"
		endtry
	endif
enddef

autocmd TabEnter * :call g:TerminalInputMode()

# ----------------------------------------
# session
g:SessionsDir = $"{$MYVIMDIR}{g:back_slash}sessions" # TODO(bader): find a joinpath function, avoid manual labour
def g:ListSessions(): void
	var sessions: string = system($"ls {g:SessionsDir}")
	echo sessions
enddef


def g:SaveSession(name: string): void
	echo "listing sessions ..."
	execute $"mksession {g:SessionsDir}{g:back_slash}{name}"
enddef

autocmd VimEnter :call g:ListSessions()<CR>



# resizing windows
# TODO(bader): make c-w enters a mode that allows you to use mappings to increase and decrease etc
nnoremap <c-<s-i>> :vertical resize +5<CR>
nnoremap <c-i> :resize +5<CR>
nnoremap <c-=> <c-w><c-=><CR>:echo "hi"<CR>
