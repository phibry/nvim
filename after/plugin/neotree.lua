require("neo-tree").setup({
    close_if_last_window = true,
    enable_diagnostics = true,
    enable_git_status = true,
    window = {
        position = "right",
    },
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
        },
    },
})

vim.keymap.set("n", "<leader>rr", ":Neotree reveal<CR>")
vim.keymap.set("n", "<leader>ee", ":Neotree toggle<cr>")
