vim9script

# TODO:
# [*]- use substitute to insert the query into the url, instead of concat
# [*]- add udm=14 after doing the previous step

var QUERYHERE: string = "QUERYHERE"
var CMDHERE: string = "CMDHERE"

var exec_format: string = $"xdg-open \"{CMDHERE}\""

if $OS == "Windows_NT"
    exec_format = $"start \"\" \"{CMDHERE}\""
endif

var engines: dict<string> = {}

engines["g"] = $"https://www.google.com/search?q={QUERYHERE}&udm=14"
engines["d"] = $"https://www.duckduckgo.com/search?q={QUERYHERE}"
engines["y"] = $"https://www.youtube.com/search?q={QUERYHERE}"

echo engines['g']

def g:SearchWeb(kw: string): void
    var splits = kw->split(' ', false)
    var engine: string = splits[0]
    var query: string

    if !engines->has_key(engine)
        echo $"engine {engine} not supported!"
        return
    endif

    for i in range(1, len(splits) - 1)
        query = $"{query}+{splits[i]}"
    endfor

    var cmd: string = engines[engine]

    cmd = substitute(cmd, QUERYHERE, query, "")
    # bug here: the & is being interpreted by the regex
    # must be escaped
    cmd = escape(cmd, '&')
    cmd = substitute(exec_format, CMDHERE, cmd, "")


    system(cmd)
enddef

:command -nargs=* Webget call g:SearchWeb("<args>")
