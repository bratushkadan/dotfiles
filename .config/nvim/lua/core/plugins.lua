local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { 'phaazon/hop.nvim' },
    { 'ThePrimeagen/vim-be-good' },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- color theme
    { 'joshdick/onedark.vim' }, -- color theme
    { 'Mofiqul/vscode.nvim' }, -- color theme
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "s1n7ax/nvim-window-picker",
          "3rd/image.nvim" -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    { 'nvim-treesitter/nvim-treesitter' },
    -- LSP support
    { 'neovim/nvim-lspconfig' },
    {
        'williamboman/mason.nvim',
        dependencies = {
            'WhoIsSethDaniel/mason-tool-installer.nvim'
        }
    },
    { 'williamboman/mason-lspconfig.nvim' },
    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },

    -- Linting & formatting
    { 'nvimtools/none-ls.nvim' },

    -- DAP support
    { 'mfussenegger/nvim-dap' },
    -- DAP Go with ease
    {
        'leoluz/nvim-dap-go',
        dependencies = 'mfussenegger/nvim-dap',
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-live-grep-args.nvim',
                version = '^1.0.0'
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            }
        },
        config = function ()
           require('telescope').load_extension('live_grep_args')
        end
    },
    { 'windwp/nvim-autopairs' },
    { 'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
    {
        'someone-stole-my-name/yaml-companion.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
        }
    },
    { "b0o/schemastore.nvim" },
    -- {
    --     'olexsmir/gopher.nvim',
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    -- },
})

