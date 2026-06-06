vim9script

var FINDER_CMD = "fzf"

def g:InvokeFinder(): void
    if !executable(FINDER_CMD)
        echo $"error {FINDER_CMD} not found"
        return
    endif

    var cursor = winsaveview()

    var modes = ["e", "sp", "vsp", "tabnew", "r"] # r is for adding a file to the current one
    var prompt: string = ""

    for i in range(len(modes))
        # prompt = prompt .. $"{i + 1}: {modes[i]}\n" # removed numbers as it
        # is confusing
        prompt = prompt .. $"\t-> {modes[i]}\n"
    endfor

    prompt = prompt .. "> "

    var mode: string = input(prompt)

    if index(modes, mode) == -1
        return
    endif

    var file: string = system(FINDER_CMD)
    if file->trim() == ""
        return
    endif
    execute $":{mode} {file}"

    winrestview(cursor)
enddef

nnoremap <c-p> :call g:InvokeFinder()<CR>
inoremap <c-p> <esc>:call g:InvokeFinder()<CR>
