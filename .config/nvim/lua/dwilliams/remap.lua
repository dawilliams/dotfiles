vim.g.mapleader = " "
-- <leader> references mapleader
-- First letter in set() is mode. "n" is normal mode. "v" is visual mode
-- pv stands for project view
-- space+pv will open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Shift+j or Shift+k will highlighted text up(K) or down(J)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Shift+j will join the current line with the one below while keeping the 
-- cursor where it is. 
vim.keymap.set("n", "J", "mzJ`z")
-- Ctrl+d or Ctrl+u will 1/2 page jump up(u) or down(d) while keeping the 
-- cursor in the center.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- n or N will cycle through a search term while keeping it centered.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- space+y will copy to system clipboard register
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- delete to void register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
-- Shift+q is a no op.
vim.keymap.set("n", "Q", "<nop>")
-- space+f formats code based on lsp
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- quick fix list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- replace current word under cursor everywhere in the file. 
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make current file excutable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
