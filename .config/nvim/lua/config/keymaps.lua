local telescope = require('telescope.builtin')
return {
    init = function()
        local map = vim.keymap.set

        map('n', '<leader>p', '"*p', { silent = true, desc = 'put from mouse' })
        map(
            'n',
            '<leader>P',
            '"*P',
            { silent = true, desc = 'put before from mouse' }
        )
        map(
            'n',
            '<leader>y',
            '"*y',
            { silent = true, desc = 'yank into mouse' }
        )
        map(
            'n',
            '<leader>Y',
            '"*Y',
            { silent = true, desc = 'yank line into mouse' }
        )

        map(
            'n',
            '<leader>e',
            ":e <C-R>=expand('%:p:h') . '/'<CR>",
            { desc = 'Edit relative file' }
        )

        map(
            'n',
            '[d',
            vim.diagnostic.goto_prev,
            { desc = 'previous diagnostic' }
        )
        map('n', ']d', vim.diagnostic.goto_next, { desc = 'next diagnostic' })
        map(
            'n',
            '<leader>d',
            vim.diagnostic.open_float,
            { desc = 'open floating diagnostic message' }
        )
        map(
            'n',
            '<leader>q',
            vim.diagnostic.setloclist,
            { desc = 'open diagnostics list' }
        )

        map('n', 'gs', '<cmd>Git<CR>', { desc = 'git status' })
        map('n', 'g<space>', ':Git ', { desc = 'git' })
    end,

    telescope = {
        { '<leader>b', telescope.buffers, desc = 'buffers' },
        {
            '<leader>f',
            function()
                telescope.find_files({
                    find_command = {
                        'rg',
                        '--files',
                        '--hidden',
                        '-g',
                        '!.git',
                    },
                })
            end,
            desc = 'files',
        },
        {
            '<leader>F',
            function()
                telescope.find_files({ cwd = vim.fn.expand('%:p:h') })
            end,
            desc = 'relative files',
        },
        { '<leader>o', telescope.oldfiles, desc = 'oldfiles' },
        { '<leader>/', telescope.live_grep, desc = 'grep' },
        { 'gb', telescope.git_branches, desc = 'git branches' },
        { 'z=', telescope.spell_suggest, desc = 'spell suggest' },
    },

    lsp_local = function(_, buffer)
        local nmap = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = buffer, desc = desc })
        end

        nmap('<leader>r', vim.lsp.buf.rename, 'rename')
        nmap('<leader>a', vim.lsp.buf.code_action, 'code action')

        nmap('gd', telescope.lsp_definitions, 'definitions')
        nmap('gD', vim.lsp.buf.declaration, 'declaration')
        nmap('gr', telescope.lsp_references, 'references')
        nmap('gI', telescope.lsp_implementations, 'implementations')
        nmap('<leader>D', telescope.lsp_type_definitions, 'type definitions')
        nmap('<leader>s', telescope.lsp_document_symbols, 'document symbols')
        nmap(
            '<leader>S',
            telescope.lsp_dynamic_workspace_symbols,
            'workspace symbols'
        )

        nmap('K', vim.lsp.buf.hover, 'hover')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'signature help')
    end,
}
