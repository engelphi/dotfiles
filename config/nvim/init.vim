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
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'powerline/fonts', { 'do': './install.sh' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install.sh --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'Shougo/echodoc.vim'
Plug 'dense-analysis/ale'
"Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neocomplete.vim'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'arcticicestudio/nord-vim'
call plug#end()

"call deoplete#custom#option('omni_patterns', {
"\ 'go': '[^. *\t]\.\w*',
"\})


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 0
let g:airline_powerline_fonts=1
"let g:airline_theme_bg='dark'
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#split_buffers = 0
let g:airline#extensions#tabline#show_buffers = 0
"set completeopt-=preview
set completeopt=noinsert,menuone,noselect

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""VIM-GO
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_term_mode = "split"
let g:go_term_height = 10
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
au FileType go nmap <F4> :GoTest -short<CR>
au FileType go nmap <F5> :GoCoverageToggle -short -tags="all integration"<CR>

""LANGUAGE CLIENT
let g:LanguageClient_autoStart = 1  
let g:LanguageClient_serverCommands = {}
let g:LanguageClient_useVirtualText = 0
if executable('clangd')
	let g:LanguageClient_serverCommands.cpp = ['clangd', '--background-index', '--completion-style=detailed', '-j=4']
endif

"if executable('go-langserver')
  "let g:LanguageClient_serverCommands.go = ['go-langserver', '-gocodecompletion']
"endif

"" Run gofmt on save
autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.ipp,*.go :call LanguageClient#textDocument_formatting_sync()


if executable('pyls')
	let g:LanguageClient_serverCommands.python = ['pyls']
endif

if executable('javascript-typescript-stdio')
	let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
	let g:LanguageClient_serverCommands.typescript = ['javascript-typescript-stdio']
	let g:LanguageClient_serverCommands.html = ['html-languageserver', '--stdio']
	let g:LanguageClient_serverCommands.css = ['css-languageserver', '--stdio']
	let g:LanguageClient_serverCommands.less = ['css-languageserver', '--stdio']
	let g:LanguageClient_serverCommands.json = ['json-languageserver', '--stdio']
endif

if executable('java-lang-server')
	let g:LanguageClient_serverCommands.java = ['java-lang-server', '-Dlog.level=ALL']
endif

autocmd BufEnter * call ncm2#enable_for_buffer()

"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('smart_case', v:true)

 "Automatically start language servers.                                                                                                                            
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gt :call LanguageClient_textDocument_typeDefinition()<CR>
nnoremap <silent> rn :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> fm :call LanguageClient_textDocument_formatting()<CR>
nnoremap <silent> rf :call LanguageClient_textDocument_references()<CR>

" echodoc setup
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

set signcolumn=yes

let g:ale_linters = {
\	'cpp': ['clangtidy','clangd','cppcheck']
\}

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
set cmdheight=1
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
"set background=dark
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
"set expandtab
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
"map <F1> :set spell! spelllang=en<CR>
"map <F4> :set spell! spelllang=de_20<CR>
"map <F5> :tabnew<CR>
"map <F6> :tabn<CR>
"map <F7> :tabp<CR>
"map <F8> :tabclose<CR>
map <F9> :so $MYVIMRC<CR>

imap <C-s> <ESC>:w<CR>
vmap <C-s> <ESC>:w<CR>

"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>

