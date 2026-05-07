vim9script

def g:CommentLine2(): void
    var commentSymbols: dict<string> = { c: '\\', python: '\#', javascript: '\\', vim: '\#' }

    var beginsWithCommentRegex: string = $"^\\s*{commentSymbols[&filetype]}"
    var commentLineCmd: string = $"s/\\s*\\(\\S*\\)/{commentSymbols[&filetype]} \\1"
    var uncommentLineCmd: string = $"s/\\s*{commentSymbols[&filetype]}\\(\\S*\\)/\\1"


    echo commentLineCmd
    echo uncommentLineCmd

    if getline('.') =~ beginsWithCommentRegex
        echo $"line is commented: {getline('.')}"
        execute uncommentLineCmd
    else
        echo $"line is not commented: {getline('.')}"
        execute commentLineCmd
    endif

enddef


def g:CommentLine(): void

enddef

nnoremap <f12> :call CommentLine()<CR>
