require("config.lazy") -- lazy config must come first
require("config.diagnostic")
require("config.lsp")
require("config.terminal")

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
vim.keymap.set('n', '-', '<cmd>Oil --float<CR>')            -- When in normal mode("n"), press - to open the Oil file browser
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')         -- When in normal mode("n"), press <Esc> to clear highlights on search
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
