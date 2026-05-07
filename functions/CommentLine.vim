vim9script


def g:CommentLine_(): void
    var line: string = getline('.')
    var ft: string = &filetype
    var commentSymbols: dict<string> = { c: '//', python: '#', javascript: '//' }

    if !commentSymbols->has_key(ft)
        echo ft .. " does not exist in dictionary."
        return
    endif

    var symbol: string = commentSymbols[ft]
    symbol = escape(symbol, "/")
    var beginsWithCommentRegex: string = '^\s*' .. symbol
    var commentLineCmd: string = 's/\(\s*\)\(.*\)/' .. '\1' .. symbol .. ' \2'
    var uncommentLineCmd: string = 's/\(\s*\)' .. symbol .. '\s*\(\S*\)/\1\2'

    if line =~ beginsWithCommentRegex
        execute uncommentLineCmd
    else
        execute commentLineCmd
    endif

enddef

def g:CommentLine(): void
    var line: string = getline('.')
    var ft: string = &filetype
    var commentPatterns: dict<string> = { c: '\(\s*\)//\(\s*\)\(\S*\)', javascript: '\(\s*\)//\(\s*\)\(\S*\)'}

    if !commentPatterns->has_key(ft)
        echo ft .. " does not exist in dictionary."
        return
    endif

    var commentPattern: string = commentPatterns[&filetype]

    if line =~ commentPattern
        echo "line is commented"
        execute $"s/{commentPattern}/\\1 \\2/"
    else
        echo "line is not commented"
    endif

enddef

# nnoremap <silent> <f12> :call CommentLine()<CR>
vnoremap <silent> / :call CommentLine()<CR>gv


def g:CommentMe(): void
    echo "calling CommenMe!"
    # var escapedChars: string = '/[]()\'
    var escapedChars: string = '/'
    var yankIntoRegCmd: string = '\=add(matches, submatch(0))'
    # var locPattern: string = escape('(\s*)(\S*)', escapedChars)
    var locPattern: string = '\zs' .. '\(\s*\)\(\s*\)' .. '\ze'
    var commentedPatterns: dict<string> = { c: $'// {locPattern}', vim: $'# {locPattern}' }
    var ft = &filetype

    if !commentedPatterns->has_key(ft)
        echo ft .. " not supported"
        return
    endif

    # var commentedPattern: string = escape(commentedPatterns[ft], escapedChars)
    var commentedPattern: string = escape(commentedPatterns[ft], escapedChars)
    var commented: bool = getline('.') =~ commentedPattern

    if commented
        # extract loc without comment symbol
        # yank loc into register c
        # var cmd: string = escape($'.g/{commentedPattern}/)
        var matches = []
        echo "matchstr: " .. matchstr(getline('.'), commentedPattern)
        echo "substitue: " .. substitute(getline('.'), commentedPattern, yankIntoRegCmd, '')
        echo "@c" .. @c

        echo "matches:"
        echo matches
    else
        echo getline('.') .. " is not commented "
    endif

enddef

vnoremap <f12> :call CommentMe()<CR>
# commented 



def g:CommentMe2(): void
    var ft = &filetype
    var commentedPatterns: dict<string> = { vim: '#\(\s*\)\(\s*\)' }
    var nonCommentedPatterns: dict<string> = { vim: '# line' }
    var commented: bool = commentedPatterns[ft] =~ getline('.')
    var commentedPattern = commentedPatterns[ft]
    echo commentedPattern
    echo commentedPatterns
    var nonCommentedPattern = nonCommentedPatterns[ft]

    if commented
        execute $'s/{commentedPattern}/\1\2'
    else
        # 1. get line and the whitespaces before it:
        execute ':s/\(\s*\)\(\S*\)/=setreg("c", submatch(1))'
        echo "c: " .. @c
    endif
enddef

vnoremap <f12> :call CommentMe2()<CR>
# vim comment
