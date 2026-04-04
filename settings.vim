vim9script

g:interpreters = {python: "python", js: "deno run", ts: "deno run"}
g:shell_ext = ($OS == "Windows_NT" ? "bat" : "sh")
g:clear_cmd = ($OS == "Windows_NT" ? "cls" : "clear")
g:del_cmd = ($OS == "Windows_NT" ? "del /q" : "clear")
g:back_slash = ($OS == "Windows_NT" ? "\\" : "/")
g:build_file = $"build.{g:shell_ext}"

syntax on
# &guicursor = "" #TODO(bader): investigate
&termguicolors = true
&background = "dark" # or light, for vim to choose colors fitting the theme (dark theme or light one)
# &textwidth = 80
&wrap = false
&number = true
&relativenumber = true
&showmode = false
&wildmenu = true
&wildoptions = "pum"
&autoindent = true
&smartindent = true
&smarttab = true
&tabstop = 4
&shiftwidth = 4

if &filetype == "python"
    &expandtab = true
endif

&guifont = 'Lucida Console:h11:cANSI:qDRAFT'
&guioptions = "aic"
g:colors_name = "slate"
execute $"colorscheme {g:colors_name}"
&listchars = 'eol:;,tab:-->,lead:.'
&belloff = 'all'
&laststatus = 2
&statusline = $"%2.4n: %f \ \ \ %m %r %h  l%6.8l :c%3.3c %3.3p%%"
# &timeoutlen = 300
# autocmd BufRead * :set foldmethod=indent
&foldmethod = "indent"
# var salutation: string = $"{$USERNAME} @ {$OS} @ {expand('.')}"
# autocmd VimEnter * :echo salutation

&clipboard = 'unnamed,unnamedplus'

&undodir = expand('~/vimfiles/undodir')
&directory = expand('~/vimfiles/swapdir')
&backupdir = expand('~/vimfiles/backupdir')

&undofile = true
&backup = false
&swapfile = false

&autoread = true

&incsearch = true
# &inccommand = "split" # TODO(bader): this is a neovim exclusive, live preview of :/s substitutions
&ignorecase = true
&smartcase = true # when you deliberately type caps, case is not ignored
&scrolloff = 10
&signcolumn = "yes" #TODO(bader): investigate

&splitright = true
&splitbelow = true

&signcolumn = "yes"

&updatetime = 50
# &colorcolumn = "80"
&mouse = "a"
# &isfname = "@-@" # TODO(bader): future revisit this
# &editorconfig = true # TODO(bader): appears to be a neovim exclusive as well

# set guicursor+=i:ver100-iCursor 
