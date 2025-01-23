return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      require("lspconfig").lua_ls.setup {
        capabilities = capabilities,
        -- TODO: The following keymaps can be removed in neovim 0.11
        vim.keymap.set("n", "grn", function()
          vim.lsp.buf.rename()
        end, { desc = 'vim.lsp.buf.rename()' }),

        vim.keymap.set({ "n", "x" }, "gra", function()
          vim.lsp.buf.code_action()
        end, { desc = 'vim.lsp.buf.code_action()' }),

        vim.keymap.set("n", "grr", function()
          vim.lsp.buf.references()
        end, { desc = 'vim.lsp.buf.references()' }),

        vim.keymap.set("i", "<C-S>", function()
          vim.lsp.buf.signature_help()
        end, { desc = 'vim.lsp.buf.signature_help()' })
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  }
}
