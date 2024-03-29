local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	 if server.name == "jsonls" then
	 	local jsonls_opts = require("user.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

     if server.name == "clangd" then
        local clangd_opts = require("user.lsp.settings.clangd")
        opts = vim.tbl_deep_extend("force", clangd_opts, opts)
     end

     if server.name == "cmake" then
         local cmake_opts = require("user.lsp.settings.cmake")
         opts = vim.tbl_deep_extend("force", cmake_opts, opts)
     end

     if server.name == "jedi_language_server" then
         local jls_opts = require("user.lsp.settings.jls")
         opts = vim.tbl_deep_extend("force", jls_opts, opts)
     end

     if server.name == "rust_analyzer" then
         local ra_opts = require("user.lsp.settings.rust_analyzer")
         opts = vim.tbl_deep_extend("force", ra_opts, opts)
     end

     if server.name == "gopls" then
         local go_opts = require("user.lsp.settings.gopls")
         opts = vim.tbl_deep_extend("force", go_opts, opts)
     end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
