return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")

        local mason_lspconfig = require("mason-lspconfig")

        mason.setup()

        mason_lspconfig.setup({
            ensure_installed = {
                "tsserver",
                "html",
                "cssls",
                "gopls",
                "emmet_ls",
                "jsonls",
                "jdtls",
            },
            automatic_installation = true,
        })

    end
}
