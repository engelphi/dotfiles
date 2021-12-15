Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/echodoc.vim'

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
