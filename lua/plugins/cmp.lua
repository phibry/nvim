return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        "L3MON4D3/LuaSnip", -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        -- loads vscode style snippets from plugins (e.g friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completions = {
                completeopt = "menu,menuone,preview,noselect",
            },

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),

            sources = cmp.config.sources({
                { name = "luasnip"},
                { name = "buffer"},
                { name = "path"},
            }),
        })
    end,
}
