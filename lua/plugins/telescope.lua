return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<leader>pw", "<CMD>Telescope grep_string<CR>")
        vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})

        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({})
        
        telescope.load_extension("fzf")
    end
}
