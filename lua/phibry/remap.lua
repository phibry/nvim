-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remap esc
vim.keymap.set("i", "jk", "<ESC>")

-- netrw
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

-- movements
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")

-- copy from cusor until end of line
vim.keymap.set("n", "Y", "yg$")

-- cursor stays in place
vim.keymap.set("n", "J", "mzJ`z")

-- disable spacebar
vim.keymap.set("n", "space", "<nop>")

-- stay in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "gg", "ggzz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- paste from clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")

-- dont save deletions to register
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<leader>d", "\"_d")

-- save yanks to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- search and replace under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- resize panes
vim.keymap.set("n", "<C-w><Right>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<C-w><Up>", ":resize +5<CR>")
vim.keymap.set("n", "<C-w><Down>", ":resize -5<CR>")
vim.keymap.set("n", "<C-w><Left>", ":vertical resize -5<CR>")

-- close pane
vim.keymap.set("n", "<C-w>x", ":close<CR>") -- x, close

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

