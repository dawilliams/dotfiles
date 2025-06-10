vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>") -- Escape terminal mode by typing esc esc.

-- Customize terminal options
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Customize Neovim Terminal Options',
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false         -- no line numbers
    vim.opt.relativenumber = false -- no relative line numbers
  end,
})

-- Configure terminal that is 15 lines tall at the bottom of the screen
vim.keymap.set("n", "<space>st", function() -- st = small terminal
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
end)
