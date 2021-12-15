Plug 'powerline/fonts', { 'do': './install.sh' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts=1
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#split_buffers = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#ale#enabled = 1

set completeopt=noinsert,menuone,noselect
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:deoplete#enable_at_startup = 1
let g:float_preview#docked = 1
