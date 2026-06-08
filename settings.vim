vim9script

var is_windows: bool = ($OS == "Windows_NT")

g:interpreters = {python: "python", js: "deno run", ts: "deno run"}
g:shell_ext = (is_windows ? "bat" : "sh")
g:clear_cmd = (is_windows ? "cls" : "clear")
g:del_cmd = (is_windows ? "del /q" : "clear")
g:back_slash = (is_windows ? "\\" : "/")
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
&softtabstop = 4
&shiftwidth = 4
&expandtab = true

# &guifont = 'Lucida Console:h14:cANSI:qDRAFT'
if has("gui_running")
    &guioptions = "aic!"
    if $OS == "Windows_NT"
        &guifont = 'Lucida Console:h11:cANSI:qDRAFT'
        if executable("bash")
            &shell = 'C:\tools\Git\usr\bin\bash.exe'
            set shellcmdflag=--login\ -c
            set shellxquote=\"
            set shellslash
        endif
        # &renderoptions["type"] = "directx"
    endif
endif
g:colors_name = "slate"
execute $"colorscheme {g:colors_name}"
&listchars = 'eol:;,tab:-->,lead:.'
&belloff = 'all'
&laststatus = 2
&statusline = $"%2.4n: %f \ \ \ %m %r %h  l%6.8l :c%6.8c %4.4p%%"
# autocmd BufRead * :set foldmethod=indent
&foldmethod = "indent"
set nofoldenable
&clipboard = 'unnamed,unnamedplus'

&backup = false
&writebackup = false
&swapfile = false

&undodir = expand('~/vimfiles/undodir')
&directory = expand('~/vimfiles/swapdir')
&backupdir = expand('~/vimfiles/backupdir')

&undofile = true
&backup = false
&swapfile = false

&autoread = true
&incsearch = true
# &inccommand = "split" # TODO(bader): this is a neovim exclusive, live preview of :/s substitutions
# &ignorecase = true
&smartcase = true # when you deliberately type caps, case is not ignored
# this was fetched from stackoverflow to make autocompletion casesensitive
au InsertEnter * set noignorecase
au InsertLeave * set ignorecase
&scrolloff = 10
&signcolumn = "yes" #TODO(bader): investigate

&splitright = true
&splitbelow = true

&signcolumn = "yes"

&updatetime = 300
&ttimeoutlen = 0
&autowrite = false
# &colorcolumn = "80"
&mouse = "a"
# &isfname = "@-@" # TODO(bader): future revisit this
# &editorconfig = true # TODO(bader): appears to be a neovim exclusive as well

# set guicursor+=i:ver100-iCursor 

# &backspace = "indent,eol,start" # better backspace behavior

auto FileType html set filetype=htmldjango
