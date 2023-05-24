require("neo-tree").setup({
    close_if_last_window = true,
    enable_diagnostics = true,
    enable_git_status = true,
    window = {
        position = "right",
    },
})

vim.keymap.set("n", "<leader>rr", ":Neotree reveal<CR>")
vim.keymap.set("n", "<leader>ee", ":Neotree toggle<cr>")
