let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <F10> :!clear && ruff format %:editi
inoremap <F8> :!clear && mypy % --check-untyped-defs
inoremap <F6> :call g:CallMyPy()
inoremap <F7> :!clear && ruff format && ruff check --fix %:editi
inoremap <C-G>l :term git log
inoremap <C-G>p :call g:GitPush()
inoremap <C-G>c :call g:GitCommit()
inoremap <C-G>s :call g:GitStage()
inoremap <silent> <M-L> :tabm +1
inoremap <silent> <M-H> :tabm -1
inoremap <silent> <M-l> :tabnext
inoremap <silent> <M-h> :tabprevious
inoremap <C-Q> :q
inoremap <C-CR> :term
inoremap <C-T> :tabnew
inoremap <F9> :!clear && ruff check --fix %:editi
inoremap <F2> :call g:ToggleNumber()
inoremap <C-BS> diwa
inoremap <C-Space> :call g:SwapWordForSnippet()a
inoremap <C-O> :wa
cnoremap <C-V> +
cnoremap <C-E> <End>
cnoremap <C-A> <Home>
inoremap <C-E> $a
inoremap <C-A> ^i
inoremap <F11> :call g:togglefullscreen()
inoremap <C-L> l
inoremap <C-K> k
inoremap <C-J> j
inoremap <C-H> h
inoremap <C-B> Lex 10
inoremap <C-F> viw"cygv
inoremap <silent> <F5> :call g:Run_current_file()
inoremap <F1> :call g:Toggle_listchars()i
inoremap <C-X> dd
inoremap <C-V> p
inoremap <C-D> yyp
inoremap <C-C> yy
inoremap <C-S> :w
map! <S-Insert> *
nnoremap  ^
vnoremap  ^
nnoremap  :Lex 10
vnoremap  :Lex 10
nnoremap  yy
vnoremap  :s/
nnoremap  $
vnoremap  $
nnoremap  viw"cygv
vnoremap  *
vnoremap l :term git log
nnoremap l :term git log
vnoremap p :call g:GitPush()
nnoremap p :call g:GitPush()
vnoremap c :call g:GitCommit()
nnoremap c :call g:GitCommit()
vnoremap s :call g:GitStage()
nnoremap s :call g:GitStage()
tnoremap  Nh
nnoremap  h
vnoremap  h
vnoremap 	 >gv
nnoremap 	 :resize +5
tnoremap <NL> Nj
nnoremap <NL> j
vnoremap <NL> j
tnoremap  Nk
nnoremap  k
vnoremap  k
tnoremap  Nl
nnoremap  l
vnoremap  l
vnoremap  :q
nnoremap  :q
vnoremap  :w
nnoremap  :w
vnoremap  :tabnew
nnoremap  :tabnew
tnoremap  N:call CopyIntoTerminal()
nnoremap  p
nnoremap  dd
vnoremap  x
tnoremap  N
nnoremap <c-I> :vertical resize +5
tnoremap <silent> <c-s-PgUp> N:tabm -1
tnoremap <silent> <c-s-PgDown> N:tabm +1
vnoremap <silent> <c-s-PgDown> :tabm +1
vnoremap <silent> <c-s-PgUp> :tabm -1
nnoremap <silent> <c-s-PgDown> :tabm 1
nnoremap <silent> <c-s-PgUp> :tabm -1
tnoremap <silent> <c-PgUp> N:tabprevious
tnoremap <silent> <c-PgDown> N:tabnext
vnoremap <silent> <c-PgDown> :tabnext
vnoremap <silent> <c-PgUp> :tabprevious
nnoremap <silent> <c-PgDown> :tabnext
nnoremap <silent> <c-PgUp> :tabprevious
inoremap <silent> Ì :tabm +1
inoremap <silent> È :tabm -1
inoremap <silent> ì :tabnext
inoremap <silent> è :tabprevious
nnoremap J mzJ`z # TODO(bader): learn how
vnoremap J :m '>+1gv=gv 
nnoremap K V:m '<-2gv=gv
vnoremap K :m '<-2gv=gv
vnoremap f :call g:ReplaceWordWith()
xmap gx <Plug>(open-word-under-cursor)
nmap gx <Plug>(open-word-under-cursor)
vnoremap <F10> :!clear && ruff format %:edit
vnoremap <F8> :!clear && mypy % --check-untyped-defs
nnoremap <F8> :!clear && mypy % --check-untyped-defs
vnoremap <F6> :call g:CallMyPy()
nnoremap <F6> :call g:CallMyPy()
vnoremap <F7> :!clear && ruff format && ruff check --fix %:edit
nnoremap <F7> :!clear && ruff format && ruff check --fix %:edit
xnoremap <Plug>(open-word-under-cursor) <ScriptCmd>vim9.Open(getregion(getpos('v'), getpos('.'), { type: mode() })->join())
nnoremap <Plug>(open-word-under-cursor) <ScriptCmd>vim9.Open(GetWordUnderCursor())
vnoremap <C-G>l :term git log
nnoremap <C-G>l :term git log
vnoremap <C-G>p :call g:GitPush()
nnoremap <C-G>p :call g:GitPush()
vnoremap <C-G>c :call g:GitCommit()
nnoremap <C-G>c :call g:GitCommit()
vnoremap <C-G>s :call g:GitStage()
nnoremap <C-G>s :call g:GitStage()
nnoremap <C-=> <C-=>:echo "hi"
nnoremap <C-I> :resize +5
tnoremap <silent> <M-L> N:tabm +1
tnoremap <silent> <M-H> N:tabm -1
vnoremap <silent> <M-L> :tabm +1
vnoremap <silent> <M-H> :tabm -1
nnoremap <silent> <M-L> :tabm +1
nnoremap <silent> <M-H> :tabm -1
tnoremap <silent> <M-l> N:tabnext
tnoremap <silent> <M-h> N:tabprevious
vnoremap <silent> <M-l> :tabnext
vnoremap <silent> <M-h> :tabprevious
nnoremap <silent> <M-l> :tabnext
nnoremap <silent> <M-h> :tabprevious
vnoremap <C-Q> :q
nnoremap <C-Q> :q
vnoremap <C-CR> :term
nnoremap <C-CR> :term
vnoremap <C-T> :tabnew
nnoremap <C-T> :tabnew
tnoremap <C-L> Nl
tnoremap <C-K> Nk
tnoremap <C-J> Nj
tnoremap <C-H> Nh
tnoremap <C-V> N:call CopyIntoTerminal()
tnoremap <C-CR> N:q!
nnoremap <F12> :call g:CommentLine()
nnoremap <C-Space> :call g:SwapWordForSnippet()
nnoremap <F10> :!clear && ruff format %:edit
nnoremap <F9> :!clear && ruff check --fix %:edit
vnoremap <F9> :!clear && ruff check --fix %:edit
nnoremap <F2> :call g:ToggleNumber()
vnoremap <F2> :call g:ToggleNumber()
vnoremap <F12> :call g:VisualMode()
vnoremap <S-Tab> <gv
nnoremap <C-A> ^
nnoremap <C-E> $
vnoremap <C-E> $
vnoremap <C-A> ^
nnoremap <F11> :call g:togglefullscreen()
vnoremap <F11> :call g:togglefullscreen()
nnoremap <C-L> l
vnoremap <C-L> l
nnoremap <C-K> k
vnoremap <C-K> k
nnoremap <C-J> j
vnoremap <C-J> j
nnoremap <C-H> h
vnoremap <C-H> h
nnoremap <C-B> :Lex 10
vnoremap <C-B> :Lex 10
vnoremap <C-D> :s/
nnoremap <C-F> viw"cygv
vnoremap <C-F> *
vnoremap <silent> <F5> :call g:RunSnippet()
vnoremap <silent> <S-CR> :call g:RunSnippet()
nnoremap <silent> <F5> :call g:Run_current_file()
vnoremap <F1> :call g:Toggle_listchars()
nnoremap <F1> :call g:Toggle_listchars()
vnoremap <C-S> :w
nnoremap <C-X> dd
nnoremap <C-V> p
nnoremap <C-C> yy
nnoremap <C-S> :w
vnoremap <C-X> x
vmap <C-Del> "*d
vmap <S-Del> "*d
vmap <C-Insert> "*y
vmap <S-Insert> "-d"*P
nmap <S-Insert> "*P
cnoremap  <Home>
inoremap  ^i
inoremap  Lex 10
inoremap  yy
inoremap  yyp
cnoremap  <End>
inoremap  $a
inoremap  viw"cygv
inoremap l :term git log
inoremap p :call g:GitPush()
inoremap c :call g:GitCommit()
inoremap s :call g:GitStage()
inoremap  h
inoremap <NL> j
inoremap  k
inoremap  l
inoremap  :wa
inoremap  :q
inoremap  :w
inoremap  :tabnew
cnoremap  +
inoremap  p
inoremap  dd
inoremap <silent> <c-s-PgDown> :tabm +1
inoremap <silent> <c-s-PgUp> :tabm -1
inoremap <silent> <c-PgDown> :tabnext
inoremap <silent> <c-PgUp> :tabprevious
tnoremap <silent> Ì N:tabm +1
tnoremap <silent> È N:tabm -1
vnoremap <silent> Ì :tabm +1
vnoremap <silent> È :tabm -1
nnoremap <silent> Ì :tabm +1
nnoremap <silent> È :tabm -1
tnoremap <silent> ì N:tabnext
tnoremap <silent> è N:tabprevious
vnoremap <silent> ì :tabnext
vnoremap <silent> è :tabprevious
nnoremap <silent> ì :tabnext
nnoremap <silent> è :tabprevious
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autoread
set background=dark
set backupdir=~\\vimfiles\\backupdir
set belloff=all
set clipboard=unnamed,unnamedplus
set directory=~\\vimfiles\\swapdir
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Lucida\ Console:h11:cANSI:qDRAFT
set guioptions=aic
set helplang=En
set ignorecase
set incsearch
set laststatus=2
set listchars=eol:;,tab:-->,lead:.
set runtimepath=~/vimfiles,C:\\tools\\vim/vimfiles,C:\\tools\\vim\\vim92,C:\\tools\\vim\\vim92\\pack\\dist\\opt\\netrw,~/vimfiles/after,C:\\tools\\vim/vimfiles/after
set scrolloff=10
set shiftwidth=4
set noshowmode
set smartcase
set smartindent
set smarttab
set splitbelow
set splitright
set statusline=%2.4n:\ %f\ \ \ \ %m\ %r\ %h\ \ l%6.8l\ :c%3.3c\ %3.3p%%
set noswapfile
set tabstop=4
set termguicolors
set undodir=~\\vimfiles\\undodir
set undofile
set updatetime=50
set wildoptions=pum
set window=65
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
doautoall SessionLoadPre
silent only
silent tabonly
cd W:\sqlalchemy
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess+=aoO
badd +24 app.py
badd +0 readme.md
badd +5 test.py
badd +53 07_one_to_many.py
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit 07_one_to_many.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt test.py
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*\ %s\ */
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal completeopt=
setlocal completeslash=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal diffanchors=
setlocal equalprg=
setlocal errorformat=
setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'python'
setlocal filetype=python
endif
setlocal fillchars=
setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatoptions=tcq
setlocal formatprg=
setlocal grepformat=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
set signcolumn=yes
setlocal signcolumn=yes
setlocal smartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'python'
setlocal syntax=python
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal winhighlight=
set nowrap
setlocal nowrap
setlocal wrapmargin=0
24
sil! normal! zo
31
sil! normal! zo
30
sil! normal! zo
37
sil! normal! zo
40
sil! normal! zo
46
sil! normal! zo
53
sil! normal! zo
56
sil! normal! zo
66
sil! normal! zo
let s:l = 63 - ((35 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 63
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("readme.md", ":p")) | buffer readme.md | else | edit readme.md | endif
balt app.py
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*\ %s\ */
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal completeopt=
setlocal completeslash=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal diffanchors=
setlocal equalprg=
setlocal errorformat=
setlocal eventignorewin=
setlocal noexpandtab
if &filetype != 'markdown'
setlocal filetype=markdown
endif
setlocal fillchars=
setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=2
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatoptions=tcq
setlocal formatprg=
setlocal grepformat=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
set signcolumn=yes
setlocal signcolumn=yes
setlocal smartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'markdown'
setlocal syntax=markdown
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal winhighlight=
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 73 - ((10 * winheight(0) + 31) / 63)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 73
normal! 06|
wincmd w
wincmd =
tabnext
argglobal
terminal ++curwin ++cols=206 ++rows=63 ++type=winpty 
let s:term_buf_11 = bufnr()
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=terminal
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*\ %s\ */
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal completeopt=
setlocal completeslash=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal diffanchors=
setlocal equalprg=
setlocal errorformat=
setlocal eventignorewin=
setlocal noexpandtab
if &filetype != ''
setlocal filetype=
endif
setlocal fillchars=
setlocal findfunc=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatoptions=tcq
setlocal formatprg=
setlocal grepformat=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal lhistory=10
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
set signcolumn=yes
setlocal signcolumn=yes
setlocal smartindent
setlocal nosmoothscroll
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal wincolor=
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal winhighlight=
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 9261 - ((10 * winheight(0) + 31) / 63)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9261
normal! 014|
tabnext 1
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
set shortmess=filnxtToOS
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
