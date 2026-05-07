vim9script

# TODO(bader): how to stop a function mid call ? like how to choose not to proceed with said function ?
def g:GitPush(): void
    var cmd_get_current_branch: string = "ls"
    var branch_name: string = input("branch to push to (% for main) >>> ")

    if branch_name == "%"
        # branch_name = system(cmd_get_current_branch) # TODO(bader): fill cmd_get_current_branch
        branch_name = "main" #TODO(bader): hardcoded for now
    endif

    execute $"term ++shell git push -u origin {branch_name}"
enddef


def g:GitCommit(): void
    var commit_message: string = input("Commit message >>> ")
    echo $"term ++shell git commit -m '{commit_message}'"
    execute $"term ++shell git commit -m " .. $"\"commit_message\""
enddef


def g:GitStage(): void
    var staged_files: string = input("Files to stage (% for current file, else all dir is added) >>> ")
    if staged_files == "%"
        execute $"term ++shell git add %"
    else
        execute $"term ++shell git add ."
    endif
enddef


nnoremap <c-g><c-s> :call g:GitStage()<enter>
vnoremap <c-g><c-s> :call g:GitStage()<enter>
inoremap <c-g><c-s> :call g:GitStage()<enter>

nnoremap <c-g><c-c> :call g:GitCommit()<enter>
vnoremap <c-g><c-c> :call g:GitCommit()<enter>
inoremap <c-g><c-c> :call g:GitCommit()<enter>

nnoremap <c-g><c-p> :call g:GitPush()<enter>
vnoremap <c-g><c-p> :call g:GitPush()<enter>
inoremap <c-g><c-p> :call g:GitPush()<enter>

nnoremap <c-g><c-l> :term ++shell git log<enter>
vnoremap <c-g><c-l> :term ++shell git log<enter>
inoremap <c-g><c-l> :term ++shell git log<enter>
