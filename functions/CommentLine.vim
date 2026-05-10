vim9script


def g:TrueCommentLine(): void
    var ft: string = &filetype
    var spacesfiller: string = "spaces"
    var contentfiller: string = "content"

    var commentPatterns: dict<string> = {
        html: $'{spacesfiller}<!-- {contentfiller} -->',
        htmldjango: $'{spacesfiller}<!-- {contentfiller} -->',
        vim: $'{spacesfiller}# {contentfiller}',
        c: $'{spacesfiller}// {contentfiller}',
        python: $'{spacesfiller}# {contentfiller}',
        javascript: $'{spacesfiller}// {contentfiller}',
        typescript: $'{spacesfiller}// {contentfiller}',
        cpp: $'{spacesfiller}// {contentfiller}',
        java: $'{spacesfiller}// {contentfiller}',
    }

    if !commentPatterns->has_key(ft)
        echo $'filetype {ft} not supported!'
        return
    endif

    var mustbeescaped: string = '/'
    var line: string = getline('.')
    var spacespattern: string = '\(\s*\)'->substitute('\', '\\\\', 'g')
    var contentpattern: string = '\(\S*\)'->substitute('\', '\\\\', 'g')
    var group1: string = '\1'->substitute('\', '\\\\', 'g')
    var group2: string = '\2'->substitute('\', '\\\\', 'g')

    var commentPattern: string = escape(commentPatterns[ft], mustbeescaped)
    commentPattern = commentPattern->substitute(spacesfiller, spacespattern, '')
    commentPattern = commentPattern->substitute(contentfiller, contentpattern, '')

    var groupedpattern: string = commentPatterns[ft]->substitute(spacesfiller, group1, '')
    groupedpattern = groupedpattern->substitute(contentfiller, group2, '')
    groupedpattern = escape(groupedpattern, '/')
    var uncommentcmd = $"s/{commentPattern}/{group1->substitute('\\\\', '\', '')}{group2->substitute('\\\\', '\', '')}"
    var commentcmd = $"s/{spacespattern->substitute('\\\\', '\', 'g')}{contentpattern->substitute('\\\\', '\', 'g')}/{groupedpattern}"

    if line =~ commentPattern
        execute uncommentcmd
    else
        execute commentcmd
    endif

enddef

vnoremap <silent> / :call TrueCommentLine()<CR>gv
