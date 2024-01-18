return {
	"tpope/vim-fugitive",
	lazy = false,
    config = function ()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
    end
}
