local config = function()
    local ls = require('luasnip')
    ls.config.setup({
        enable_autosnippets = true,
    })
    require('luasnip.loaders.from_lua').lazy_load({
        paths = { '~/.config/nvim/snippets' },
    })

    vim.keymap.set({ 'i' }, '<C-k>', function()
        ls.expand()
    end, { silent = true })
    vim.keymap.set({ 'i', 's' }, '<C-f>', function()
        ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ 'i', 's' }, '<C-b>', function()
        ls.jump(-1)
    end, { silent = true })
end

return {
    'L3MON4D3/LuaSnip',
    config = config,
}
