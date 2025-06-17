return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- significantly improve sorting performance
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy" -- ivy pulls overlay from the bottom of the screen
          }
        },
        extensions = {
          fzf = {} -- significantly improve sorting performance
        }
      }

      require('telescope').load_extension('fzf')                                                       -- significantly improve sorting performance

      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags, { desc = 'find help' }) -- fh = find help
      vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)                        -- ff = find directory
      -- en = edit neovim
      vim.keymap.set("n", "<space>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config") -- cwd = current working directory
        }
      end)
      require "config.telescope.multigrep".setup() -- multigrep config located at nvim/lua/config/telescope/multigrep.lua
    end
  }
}
