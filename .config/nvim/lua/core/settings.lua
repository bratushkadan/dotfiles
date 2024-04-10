-- https://habr.com/ru/articles/64224/

-- Number for current line; relative numbers
vim.api.nvim_win_set_option(0, "number", true)
vim.api.nvim_win_set_option(0, "relativenumber", true)

-- Search
vim.opt.ignorecase = true
-- vim.opt.smartcase = true -- case-sensitive search
vim.opt.showmatch = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Scrolling
vim.opt.scrolloff = 8

-- Additional settings
vim.opt.splitright = true -- vertical splits are rendered to the right
vim.opt.splitbelow = true -- horizontal splits are rendered below
vim.opt.clipboard = "unnamedplus" -- SHARED clipboard with the system
-- opt.fixeol = false -- disable (?)
-- opt.completeopt = 'menuone,noselect' -- built-in autocomplete
-- vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]] -- do not make inserted line commented
