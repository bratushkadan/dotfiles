-- Base
require('core.plugins')
require('core.colors')

-- Plugins
-- require('plugins.cmp')
require('plugins.neotree')
require('plugins.treesitter')
require('plugins.mason')
require('plugins.telescope')

vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)

