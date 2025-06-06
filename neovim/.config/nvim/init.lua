require("config.lazy")
require("config.diagnostic")
require("config.lsp")

-- options
vim.opt.clipboard = "unnamedplus" -- Allow "p" in addition ctrl-p to paste from clipboard
vim.opt.cursorline = true         -- Show which line your cursor is on
vim.opt.inccommand = "split"      -- Preview substitutions live, as you type!
vim.o.undofile = true             -- Save undo history

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')         -- When in normal mode("n"), clear highlights on search when pressing <Esc>
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
