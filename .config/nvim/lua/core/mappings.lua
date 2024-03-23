vim.g.mapleader = ' '

vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)

-- Neotree
vim.keymap.set('n', '<leader>b', ':Neotree toggle left<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float focus<CR>')

-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', {})
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', {})
vim.keymap.set('n', '<leader>fs', ':Telescope live_grep_args<CR>', { noremap = true })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', {})
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', {})
