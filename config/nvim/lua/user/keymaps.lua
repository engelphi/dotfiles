local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap('n', '<F2>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
keymap('', '<F3>', ":call nerdcommenter#Comment('i','toggle')<CR>", {})
if vim.loop.os_uname().sysname == 'Linux' then
	keymap('', '<F8>', ':e $MYVIMRC<CR>', {})
	keymap('', '<F9>', ':so $MYVIMRC<CR>', {})
end

if vim.loop.os_uname().sysname == 'Darwin' then
	keymap('', '<F8>', ':e $MYVIMRC<CR>', {})
	keymap('', '<F9>', ':so $MYVIMRC<CR>', {})
end

if vim.loop.os_uname().sysname == 'Windows_NT' then
	keymap('', '<F8>', ':e $USERPROFILE/AppData/Local/nvim/init.lua<CR>', {})
	keymap('', '<F9>', ':so $USERPROFILE/AppData/Local/nvim/init.lua<CR>', {})
end

keymap('n', '<C-p>', ':Telescope find_files<CR>', {})
keymap('n', '<C-g>', ':Telescope live_grep<CR>', {})
keymap('n', '<C-f>', ':Telescope quickfix<CR>', {})
keymap('n', '<C-k>', ':Telescope keymaps<CR>', {})
