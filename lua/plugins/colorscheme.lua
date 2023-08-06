return {
    -- nord
    -- "shaunsingh/nord.nvim",
    -- "andersevenrud/nordic.nvim",
    -- "nordtheme/vim",
    -- "RRethy/nvim-base16",
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- vim.cmd([[colorscheme base16-nord]])
        vim.cmd([[colorscheme nord]])
    end,
}
