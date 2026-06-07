vim9script

var FZF: string = "fzf"

def g:InvokeFinder(): void
    echo "asdasdasd"
    if !executable(FZF)
        echo FZF .. " not installed"
        return
    endif

    var modes = ["e", "sp", "vsp", "tabnew", "r"]
    var file: string = trim(system(FZF))

    if file == ""
        return
    endif

    echo $"file = {file}"
    var mode: string = input(join(modes, '\n')) .. ' > '
    # TODO(bader): you can remove the next if statement and keep things
    # dynamic, i.e., you input the command yourself
    echo $"mode = {mode}"

    # if index(modes, mode) == -1
        # mode = 'vsp'
    # endif

    execute $":{mode} {file}"
enddef

nnoremap <c-p> :call g:InvokeFinder()<CR>
inoremap <c-p> <esc>:call g:InvokeFinder()<CR>
