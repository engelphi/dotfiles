Plug 'dense-analysis/ale'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linter_aliases = {
\    'bats': 'sh',
\    'conf': 'sh',
\}

let g:ale_linters = {
\   'cpp': ['clangd', 'clang-tidy'],
\}
