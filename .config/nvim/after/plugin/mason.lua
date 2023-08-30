-- Mason configuration for everything except LSPs
-- See lsp.lua for lsp configuration

-- require("mason-nvim-dap").setup() has to load after require('mason').setup({})
-- in the lsp.lua file. Type :scriptnames in vim to get load order
-- https://github.com/jay-babu/mason-nvim-dap.nvim#setup
require("mason-nvim-dap").setup({
    ensure_installed = { "delve" }
})
