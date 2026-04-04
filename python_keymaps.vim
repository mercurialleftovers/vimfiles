vim9script

nnoremap <f7> :!clear && ruff format && ruff check --fix %<enter>:edit<enter>
vnoremap <f7> <esc>:!clear && ruff format && ruff check --fix %<enter>:edit<enter>
inoremap <f7> <esc>:!clear && ruff format && ruff check --fix %<enter>:edit<enter>i
#---------------------------------------
nnoremap <f6> :call g:CallMyPy()<enter>
vnoremap <f6> <esc>:call g:CallMyPy()<enter>
inoremap <f6> <esc>:call g:CallMyPy()<enter>
#---------------------------------------
nnoremap <f8> :!clear && mypy % --check-untyped-defs<enter>
vnoremap <f8> <esc>:!clear && mypy % --check-untyped-defs<enter>
inoremap <f8> <esc>:!clear && mypy % --check-untyped-defs<enter>
#---------------------------------------
nnoremap <f9> :!clear && ruff check --fix %<enter>:edit<enter>
vnoremap <f9> <esc>:!clear && ruff check --fix %<enter>:edit<enter>
inoremap <f9> <esc>:!clear && ruff check --fix %<enter>:edit<enter>i
#---------------------------------------
nnoremap <f10> :!clear && ruff format %<enter>:edit<enter>
vnoremap <f10> <esc>:!clear && ruff format %<enter>:edit<enter>
inoremap <f10> <esc>:!clear && ruff format %<enter>:edit<enter>i
