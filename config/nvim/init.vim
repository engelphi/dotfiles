"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AUTO INSTALL VIM-PLUG PLUGIN-MANAGER IF NOT YET INSTALLED
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/echodoc.vim'
Plug 'peterhoeg/vim-qml'
Plug 'dense-analysis/ale'
Plug 'arcticicestudio/nord-vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ROBOT_SYNTAX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:robot_syntax_for_txt=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Improve C++ highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AIRLINE CONFIG 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LANGUAGE CLIENT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LanguageClient_autoStart = 1  
let g:LanguageClient_serverCommands = {}
if executable('/usr/local/Cellar/llvm/13.0.0_1/bin/clangd')
  let g:LanguageClient_serverCommands.cpp = ['/usr/local/Cellar/llvm/13.0.0_1/bin/clangd', '--header-insertion=never', '--suggest-missing-includes','-all-scopes-completion', '-completion-style=detailed', '-function-arg-placeholders', '-j=2', '-log=verbose', '-background-index',  '-cross-file-rename']
endif

if executable('pyls')
  let g:LanguageClient_serverCommands.python = ['pyls']
endif

if executable('java-lang-server')
  let g:LanguageClient_serverCommands.java = ['java-lang-server', '-Dlog.level=ALL']
endif

function SetLSPShortcuts()
  nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient_textDocument_definition({'gotoCmd': 'split'})<CR>
  nnoremap <silent> gt :call LanguageClient_textDocument_typeDefinition()<CR>
  nnoremap <silent> rn :call LanguageClient_textDocument_rename()<CR>
  nnoremap <silent> fm :call LanguageClient_textDocument_formatting()<CR>
  nnoremap <silent> rf :call LanguageClient_textDocument_references()<CR>
  nnoremap <silent> db :call LanguageClient#debugInfo()<CR>
endfunction()

augroup LSP
  let g:LanguageClient_serverStderr = '/tmp/clangd.stderr'
  autocmd!
  autocmd FileType cpp,c,javascript,python,go call SetLSPShortcuts()
augroup END

autocmd BufWritePre *.py,*.go :call LanguageClient#textDocument_formatting_sync()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NCM2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * call ncm2#enable_for_buffer()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ECHODOC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'
set signcolumn=yes

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Formatter setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format_path = '/usr/local/Cellar/llvm@9/9.0.1_2/bin/clang-format'
function! FormatOnSave()
  let l:formatdiff = 1
  py3f /usr/local/Cellar/llvm@9/9.0.1_2/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cpp,*.cc,*.hpp,*.c,*.ipp call FormatOnSave()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700
set mouse=a
set autoread
au FocusGained * :checktime
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => USER INTERFACE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7
set wildmenu
set wildignore=*.o,*~,*.pyc
set ruler
set hid
set nu rnu
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

colorscheme nord
set background=dark
set guitablabel=%M\ %f
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
map <F1> :NERDTreeToggle<CR>
map <F2> :call NERDComment(1, 'toggle')<CR>
map <F9> :so $MYVIMRC<CR>
