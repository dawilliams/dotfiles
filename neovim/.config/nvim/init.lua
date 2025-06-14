require("config.lazy") -- lazy config must come first
require("config.diagnostic")
require("config.lsp")
require("config.terminal")

-- options
vim.opt.undofile = true -- Save undo history
vim.opt.autoindent = true -- Keep indentation from previous line
vim.opt.breakindent = true -- Every wrapped line will continue visually indented
vim.opt.smartindent = true -- Determine indention based on characters and other criteria
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show line numbers relative to the cursor line
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line
vim.opt.mouse = "a" -- Enable mouse mode, useful for resizing splits
vim.opt.clipboard = "unnamedplus" -- Allow "p" in addition ctrl-p to paste from clipboard
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.ignorecase = true -- Ignore case in searches
vim.opt.smartcase = true -- Override ignorecase if search pattern contains a capital letter
vim.opt.splitright = true -- Open new tab to the right
vim.opt.splitbelow = true -- Open new tab to the bottom
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Amount to indent with << and >>
vim.opt.smarttab = true
vim.opt.softtabstop = 4 -- How many spaces are applied when pressing tab
vim.opt.tabstop = 4 -- How many spaces are shown per tab
vim.opt.list = true -- Show whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Configure how to display whitespace characters

-- keymaps
vim.keymap.set('n', '-', '<cmd>Oil --float<CR>')            -- When in normal mode("n"), press - to open the Oil file browser
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')         -- When in normal mode("n"), press <Esc> to clear highlights on search
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>") -- When in normal mode("n"), source (run) the current file(%)
vim.keymap.set("n", "<space>x", ":.lua<CR>")                -- When in normal mode("n"), source (run) the current line
vim.keymap.set("v", "<space>x", ":lua<CR>")                 -- When in visual mode("v"), source (run) the selected line(s)

-- auto commands
--- Hightlight when yanking (copying) text
--- Try it with `yap` in normal mode
--- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--- Ennable treesitter highlighting
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'lua', 'json' },
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
