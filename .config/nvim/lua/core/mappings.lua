vim.g.mapleader = " "

vim.api.nvim_win_set_option(0, "number", true)
vim.api.nvim_win_set_option(0, "relativenumber", true)

-- Buffers, Windows and Tabs: https://learnvim.irian.to/basics/buffers_windows_tabs
vim.keymap.set("n", "<leader>T", ":tabnew<CR>", { noremap = true })

-- Neotree
vim.keymap.set("n", "<leader>e", ":Neotree reveal<CR>")
vim.keymap.set("n", "<leader>b", ":Neotree toggle left<CR>")
vim.keymap.set("n", "<leader>o", ":Neotree float focus<CR>")

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep_args<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", {})
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", {})

-- Bufferline and buffer mappings
-- vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')
vim.keymap.set("n", "<leader>{", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>}", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>M", ":BufferLinePick<CR>")
vim.keymap.set("n", "<leader>X", ":bd<CR>")
vim.keymap.set("n", "<leader>s", ":BufferLineSortByTabs<CR>")

-- Motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", '"_dP')
