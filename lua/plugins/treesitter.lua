return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "go", "javascript", "typescript", "tsx", "css", "html", "lua", "markdown", "json",
                "vimdoc", "vim", "bash" },

            autotag = {
                enable = true
            },

            auto_install = true,

            sync_install = false,

            ignore_install = {},

            modules = {},

            highlight = { enable = true },

            indent = { enable = true },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-s>",
                    node_incremental = "<C-s>",
                    -- scope_incremental = "<C-a>",
                    node_decremental = "<A-s>",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.outer",
                        -- ["ac"] = "@class.outer",
                        -- ["ic"] = "@class.inner",
                    }
                },
                -- move = {
                --     enable = true,
                --     set_jumps = true,
                --     goto_next_start = {
                --         ["]m"] = "@function.outer",
                --     },
                --     goto_next_end = {
                --         ["]M"] = "@function.outer",
                --     },
                --     goto_previous_start = {
                --         ["[m"] = "@function.outer",
                --     },
                --     goto_previous_end = {
                --         ["[M"] = "@function.outer",
                --     },
                -- },
                -- swap = {
                --     enable = true,
                --     swap_next = {
                --         ["<leader>a"] = "@parameter.inner",
                --     },
                --     swap_previous = {
                --         ["<leader>A"] = "@parameter.inner",
                --     },
                -- },
            },
        })
    end
}
