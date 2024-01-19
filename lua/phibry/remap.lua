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

vim.keymap.set("n", "<C-w><Right>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<C-w><Up>", ":resize +5<CR>")
vim.keymap.set("n", "<C-w><Down>", ":resize -5<CR>")
vim.keymap.set("n", "<C-w><Left>", ":vertical resize -5<CR>")

vim.keymap.set("n", "<C-w>x", ":close<CR>")      -- x, close

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
