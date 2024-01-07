vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- window management
-- eurkey
vim.keymap.set("n", "Ù", "<C-w>s")          -- H, horizontal split
vim.keymap.set("n", "Ì", "<C-w>v")          -- V, vertical split
vim.keymap.set("n", "ë", "<C-w>=")          -- e, equals
vim.keymap.set("n", "á", ":close<CR>")      -- x, close

vim.keymap.set("n", "ù", "<C-w>h")
vim.keymap.set("n", "ú", "<C-w>j")
vim.keymap.set("n", "ĳ", "<C-w>k")
vim.keymap.set("n", "ø", "<C-w>l")

vim.keymap.set("n", "<A-Left>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<A-Down>", ":resize +5<CR>")
vim.keymap.set("n", "<A-Up>", ":resize -5<CR>")
vim.keymap.set("n", "<A-Right>", ":vertical resize -5<CR>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
