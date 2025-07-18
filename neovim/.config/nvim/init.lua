--[[

If you don't know anything about Lua, I recommend taking some time to read through a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

After understanding a bit more about Lua, you can use `:help lua-guide` as a reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation, which is very useful when you're not exactly sure of what you're looking for.

If you experience any errors run `:checkhealth` for more info.
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require("config.options")

-- [[ Basic Keymaps ]]
require("config.keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
require("config.lazy")

-- [[ LSP Config ]]
require("config.lsp")

-- [[ Terminal Config ]]
require("config.terminal")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
