local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
	  "git",
	  "clone",
	  "--depth",
	  "1",
	  "https://github.com/wbthomason/packer.nvim",
	  install_path
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
    -- let packer manage itself
    use 'wbthomason/packer.nvim'
    -- general utilities
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use "lewis6991/impatient.nvim"
    if vim.loop.os_uname().sysname == 'Windows_NT' then
        use { 'powerline/fonts', run = './install.ps1 Meslo' }
    else
        use { 'powerline/fonts', run = './install.sh Meslo' }
    end

    -- colorscheme
    use 'shaunsingh/nord.nvim'
    use "lunarvim/darkplus.nvim"

    -- coding utilities
    use 'scrooloose/nerdcommenter'

    use 'terryma/vim-multiple-cursors'
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

    -- interface
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'lewis6991/gitsigns.nvim'
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use "lukas-reineke/indent-blankline.nvim"

    -- cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- telescope
    use 'nvim-telescope/telescope.nvim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
    	require('packer').sync()
    end
end)
