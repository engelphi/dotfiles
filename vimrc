"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AUTO INSTALL VIM-PLUG PLUGIN-MANAGER IF NOT YET INSTALLED
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN LIST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" install the silver-searcher for fzf and libclang for youcompleteme c++ 
" completer before starting
call plug#begin('~/.vim/plugged')
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'powerline/fonts', { 'do': './install.sh' }
Plug 'Valloric/YouCompleteMe', { 'do':  './install.py --clang-completer --system-libclang' }
Plug 'vim-syntastic/syntastic'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'do': './install.sh --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'Shougo/neocomplete.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 0
let g:airline_powerline_fonts=1
set completeopt-=preview

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatter setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FormatOnSave()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.ipp call FormatOnSave()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700
set mouse=a
set autoread
set clipboard=unnamedplus


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => USER INTERFACE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7
set wildmenu
set wildignore=*.o,*~,*.pyc
set ruler
set cmdheight=1
set hid
set nu
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set matchpairs+=<:>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COLORS AND FONTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

colorscheme solarized
if strftime("%H") < 15
  set background=light
else
  set background=dark
endif

if has("gui_running")
	set guioptions-=T
	set guioptions+=e
	set t_Co=256
	set guitablabel=%M\ %ti
	set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
endif

set encoding=utf8
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FILES, BACKUPS AND UNDO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TEXT, TAB AND INDENT RELATED
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab
set shiftwidth=2
set tabstop=2
set expandtab
set tw=500
set ai
set si
set nowrap
set cc=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => KEY MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>
map <F3> :call NERDComment(1, 'toggle')<CR>
map <F1> :set spell! spelllang=en<CR>
map <F4> :set spell! spelllang=de_20<CR>
map <F5> :tabnew<CR>
map <F6> :tabn<CR>
map <F7> :tabp<CR>
map <F8> :tabclose<CR>
map <F9> :so $MYVIMRC<CR>
imap <C-s> <ESC>:w<CR>
vmap <C-s> <ESC>:w<CR>

