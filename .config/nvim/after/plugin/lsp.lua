local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- :help lsp-zero-keybindings
    -- :help lsp-zero-completion-keybindings
    lsp.default_keymaps({ buffer = bufnr })
    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#enable-format-on-save
    lsp.buffer_autoformat()
end)

lsp.extend_cmp()

-- require('mason').setup({}) has to load before require("mason-nvim-dap").setup()
-- in the mason.lua file. Type :scriptnames in vim to get load order.
-- https://github.com/jay-babu/mason-nvim-dap.nvim#setup
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { "gopls", "pyright" },
    handlers = { lsp.default_setup },
})

lsp.setup()
