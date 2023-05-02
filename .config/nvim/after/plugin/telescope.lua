local builtin = require('telescope.builtin')
-- <leader> references mapleader
-- 'n' is normal mode

-- Search all files for file. pf stands for project files 
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- Search files in git for file. <C-p> is Ctrl+p
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- Search file contents for string using ripgrtep. ps stands for project search 
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
