-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
            require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").bashls.setup({})

require("lspconfig").lua_ls.setup {
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = {
                    globals = {
                        'vim'
                    },
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', file),
                },
            },
        },
}
require('lspconfig').jsonls.setup({})
require("lspconfig").jinja_lsp.setup({})
-- require('lspconfig')['jinja_lsp'].setup({
--     settings = {
--         filetypes = { 'sls', 'jinja' },
--     },
--     capabilities = capabilities,
-- })
require("lspconfig").helm_ls.setup({})
require('lspconfig')['gopls'].setup {
	capabilities = capabilities,
}
require("lspconfig").pylsp.setup({})
require("lspconfig").sqls.setup({})
require("lspconfig").salt_ls.setup({
    cmd = { '/Users/bratushkadan/.pyenv/shims/python3.8', '-m', 'salt_lsp' },
    filetypes = { 'sls' },
})
require("lspconfig").ansiblels.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").terraformls.setup({})
require('lspconfig')['tsserver'].setup({
            capabilities = capabilities,
})

-- local cfg = require('yaml-companion').setup({
--     builtin_matchers = {
--         kubernetes = { enabled = true },
--     },
--     schemas = {
--         {
--           name = "Argo CD Application",
--           uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"
--         },
--         {
--           name = "SealedSecret",
--           uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/bitnami.com/sealedsecret_v1alpha1.json"
--         },
--         -- schemas below are automatically loaded, but added
--         -- them here so that they show up in the statusline
--         {
--           name = "Kustomization",
--           uri = "https://json.schemastore.org/kustomization.json"
--         },
--         {
--           name = "GitHub Workflow",
--           uri = "https://json.schemastore.org/github-workflow.json"
--         },
--     },
--     lspconfig = {
--         settings = {
--             filetypes = { 'yaml', 'yml' },
--             yaml = {
--                 validate = true,
--                 schemaStore = {
--                     enable = false,
--                     url = "",
--                 },
--                 -- schemas from store, matched by filename
--                 -- loaded automatically
--                 schemas = require('schemastore').yaml.schemas({
--                     select = {
--                         'kustomization.yaml',
--                         'GitHub Workflow',
--                     }
--                 })
--             },
--         },
--     }
-- })
--
-- require("lspconfig").yamlls.setup(cfg)
-- require('telescope').load_extension('yaml_schema')
require('lspconfig').yamlls.setup{}

require("lspconfig").autotools_ls.setup({})
require("lspconfig").marksman.setup({})

