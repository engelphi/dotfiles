--vim.cmd [[
--try
  --colorscheme darkplus
--catch /^Vim\%((\a\+)\)\=:E185/
  --colorscheme default
  --set background=dark
--endtry
--]]

vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_italic = false

require('nord').set()
--vim.cmd('colorscheme nord')
