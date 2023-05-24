return {
    -- nord
    -- "shaunsingh/nord.nvim",
    -- "andersevenrud/nordic.nvim",
    "nordtheme/vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nord]])
    end,
}

