vim9script

def g:CommentLine_2(): void
    var comment_chars: dict<string> = {vim: "#", python: "#", c: "//", js: "//", ts: "//"}

    execute "normal! ^" # to go to the very first non-white-space character

    if getline('.') =~ $"^{comment_chars[&filetype]}\s*" # if line begins with commend_char and however many whitespaces
        echo "line is commented"
    else
        echo "line is not commented"
        # setline('.',  # TODO(bader): learn regex, and how to capture groups
        echo matchlist(getline('.'), $"\s*${comment_chars[&filetype]}\s*(\w*)")
    endif
enddef



def g:CommentLine(): void
	let commentSymbols: dict<string> = { c: '\\', python: '#', javascript: '\\', vim: '#' }
	let uncomment_command: string = $"s/^{commentSymbols[&filetype]}\s*//"
	let comment_command: string = $"s/.*/{commentSymbols[&filetype]} &/"
enddef
