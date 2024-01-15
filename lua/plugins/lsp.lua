return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim"
    },

    config = function()
        -- lsp
        local on_attach = function(client, bufnr)
            client.server_capabilities.semanticTokensProvider = nil

            local nmap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end

                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end

            nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
            nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

            nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
            nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
            nmap("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
            nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
            nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
            nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

            -- See `:help K` for why this keymap
            nmap("K", vim.lsp.buf.hover, "Hover Documentation")
            nmap("<leader>K", vim.lsp.buf.signature_help, "Signature Documentation")

            -- Lesser used LSP functionality
            nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

            nmap("<leader>fc", vim.lsp.buf.format, "[F]ormat [C]ode")

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                vim.lsp.buf.format()
            end, { desc = "Format current buffer with LSP" })
        end

        -- mason
        require("mason").setup()
        require("mason-lspconfig").setup()

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)


        local mason_lspconfig = require("mason-lspconfig")
        local signs = { Error = "􀁐 ", Warn = "􀇾 ", Hint = "󰠠 ", Info = "􀁞 " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
        mason_lspconfig.setup({
            ensure_installed = {
                "tsserver",
                "gopls",
                "lua_ls",
                "emmet_ls",
                "html",
                "templ",
                -- "htmx",
            }
        })

        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "lua" },
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        lspconfig.gopls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                gopls = {
                    completeUnimported = true,
                    usePlaceholders = true,
                    analyses = {
                        unusedparams = true,
                        unusedvariable = true,
                    },
                },
            },
        })

        lspconfig.tsserver.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.html.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "html", "templ" }
        })

        lspconfig.templ.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "templ" }
        })

        lspconfig.emmet_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css" }
        })

        -- lspconfig.htmx.setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        --     filetypes = { "html", "templ" }
        -- })
    end
}
