local config = function()
    local on_attach = function(client, buffer)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(buffer, true)
        end

        require('config.keymaps').lsp_local(client, buffer)

        vim.lsp.handlers['textDocument/hover'] =
            vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
            vim.lsp.handlers.signature_help,
            { border = 'rounded' }
        )
    end

    vim.diagnostic.config({
        float = {
            border = 'rounded',
        },
    })

    require('mason').setup()
    require('mason-lspconfig').setup()

    local servers = {
        rust_analyzer = {
            ['rust_analyzer'] = {
                checkOnSave = {
                    command = 'clippy',
                },
            },
        },

        lua_ls = {
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    }

    require('neodev').setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local mason_lspconfig = require('mason-lspconfig')

    mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
    })

    mason_lspconfig.setup_handlers({
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes,
            })
        end,
    })
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',

        { 'j-hui/fidget.nvim', opts = {} },
        'folke/neodev.nvim',
    },
    config = config,
}
