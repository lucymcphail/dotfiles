local config = function()
    require('telescope').setup({
        defaults = {
            pickers = {
                find_files = {
                    find_command = {
                        'rg',
                        '--files',
                        '--hidden',
                        '-g',
                        '!.git',
                    },
                },
            },
        },
    })

    require('telescope').load_extension('fzf')
end

return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
    },
    config = config,
    keys = require('config.keymaps').telescope,
    cmd = 'Telescope',
}
