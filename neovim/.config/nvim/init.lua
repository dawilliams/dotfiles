require("config.lazy")

vim.opt.shiftwidth = 4                                      -- Set tab width to 4 spaces
vim.opt.clipboard = "unnamedplus"                           -- Allow "p" in addition ctrl-p to paste from clipboard
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>") -- When in normal mode("n"), source (run) the current file(%)
vim.keymap.set("n", "<space>x", ":.lua<CR>")                -- When in normal mode("n"), source (run) the current line
vim.keymap.set("v", "<space>x", ":lua<CR>")                 -- When in visual mode("v"), source (run) the selected line(s)

-- Hightlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

--Terminal Config
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>") -- Escape terminal mode by typing esc esc.

-- Customize terminal options
vim.api.nvim_create_autocmd('TermOpen', {
    desc = 'Customize Neovim Terminal Options',
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

-- Configure terminal that is 15 lines tall at the bottom of the screen
vim.keymap.set("n", "<space>st", function() -- st = small terminal
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end)
