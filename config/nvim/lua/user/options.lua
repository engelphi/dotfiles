vim.opt.history = 700
vim.opt.mouse = 'a'
vim.opt.autoread = true
vim.cmd [[au FocusGained * :checktime]]
vim.opt.clipboard='unnamedplus'

vim.opt.so=7
vim.opt.wildmenu=true
vim.opt.wildignore='*.o,*~,*.pyc'
vim.opt.ruler=true
vim.opt.hid=true
vim.opt.nu=true
vim.opt.rnu=true
vim.opt.backspace = 'eol,start,indent'
vim.opt.whichwrap = vim.opt.whichwrap + '<,>,h,l'
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.lazyredraw=true
vim.opt.magic=true
vim.opt.mat=2
vim.opt.errorbells=false
vim.opt.visualbell=false
vim.opt.tm=500
vim.opt.matchpairs='(:),[:],{:},<:>'

vim.cmd('syntax enable')

vim.opt.background='dark'
vim.opt.ffs='unix,dos,mac'

vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false

vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.tw = 500
vim.opt.ai = true
vim.opt.si = true
vim.opt.cc = '100'
vim.opt.wrap = false
vim.opt.showtabline = 2

vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"

vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.shortmess:append "c"

