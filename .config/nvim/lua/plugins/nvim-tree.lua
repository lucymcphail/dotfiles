vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 0,
  files = 0,
  folder_arrows = 0,
}

vim.g.nvim_tree_icons = {
  default = '',
}

return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    keys = {
        {'<leader>t', '<cmd>NvimTreeToggle<cr>', desc = "nvim-tree" },
    },
    opts = {
        renderer = {
            icons = {
                show = {
                    file = false,
                    folder = false,
                    folder_arrow = false,
                    git = false,
                    modified = false,
                    diagnostics = false,
                    bookmarks = false,
                },
            },
        },
    },
}
