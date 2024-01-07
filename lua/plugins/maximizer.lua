return {
    "szw/vim-maximizer",
    config = function()
        vim.keymap.set("n", "Ω", ":MaximizerToggle<CR>") -- eurkey
    end
}
