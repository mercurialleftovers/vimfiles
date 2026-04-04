vim9script

# TODO(bader): how to stop a function mid call ? like how to choose not to proceed with said function ?

nnoremap <c-g>s :call g:GitStage()<enter>
vnoremap <c-g>s :call g:GitStage()<enter>
inoremap <c-g>s :call g:GitStage()<enter>

nnoremap <c-g>c :call g:GitCommit()<enter>
vnoremap <c-g>c :call g:GitCommit()<enter>
inoremap <c-g>c :call g:GitCommit()<enter>

nnoremap <c-g>p :call g:GitPush()<enter>
vnoremap <c-g>p :call g:GitPush()<enter>
inoremap <c-g>p :call g:GitPush()<enter>

nnoremap <c-g>l :term git log<enter>
vnoremap <c-g>l :term git log<enter>
inoremap <c-g>l :term git log<enter>

def g:GitPush(): void
    var cmd_get_current_branch: string = "ls"
    var branch_name: string = input("branch to commit (% for current) >>> ")

    if branch_name == "%"
        # branch_name = system(cmd_get_current_branch) # TODO(bader): fill cmd_get_current_branch
        branch_name = ""
    endif

    execute $"term git push -u upstream {branch_name}"
enddef


def g:GitCommit(): void
    var commit_message: string = input("Commit message >>> ")
    execute $"term git commit -m {message}"
enddef


def g:GitStage(): void
    var staged_files: string = input("Files to stage (% for current file, else all dir is added) >>> ")
    if staged_files == "%"
        execute $"term git add %"
    else
        execute $"term git add ."
    endif
enddef
