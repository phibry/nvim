return {
	"tpope/vim-fugitive",
	lazy = false,
    config = function ()
        vim.keymap.set("n", "<leader>GS", vim.cmd.Git)
        vim.keymap.set("n", "<leader>GB", ":Git blame<CR>")
    end
}
