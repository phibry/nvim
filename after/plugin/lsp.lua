local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'eslint',
    'lua_ls',
    'jdtls',
    'marksman',
    'rust_analyzer',
    'jsonls',
    'html',
    'gopls',
    'cssls',
    'emmet_ls',
    'lemminx',
    'yamlls'
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    -- ["<C-CR>"] = cmp.mapping.complete(),
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    ["<C-CR>"] = cmp.mapping(function(fallback)
        -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
        if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                cmp.confirm()
            end
        else
            fallback()
        end
    end, { "i", "s", "c", }),
})

cmp_mappings["<Tab>"] = vim.NIL
cmp_mappings["<S-Tab>"] = vim.NIL

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr }
    lsp.default_keymaps({ buffer = bufnr })

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "H", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "D", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "gh", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set({ "n", "x" }, "<leader>fc", function()
        vim.lsp.buf.format({
            async = false,
            timeout_ms = 10000
        })
    end, opts)

end)

require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            }
        }
    }
})

require("lspconfig").emmet_ls.setup({
    filetypes = { "html", "javascript", "typescript", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "gopls" },
})

lsp.skip_server_setup({ "jdtls" })

lsp.setup()
