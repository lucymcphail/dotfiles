vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.lazy')
require('config.options')
require('config.colours')
require('config.keymaps').init()
