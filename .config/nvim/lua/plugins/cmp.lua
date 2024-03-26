-- Set up nvim-cmp.
local cmp = require('cmp')

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

local lspconfig_util = require('lspconfig.util')
local lspconfig = require('lspconfig')
local servers = { 'bashls', 'tsserver', 'jsonls', 'jinja_lsp', 'helm_ls', 'pylsp', 'sqls', 'ansiblels', 'rust_analyzer', 'terraformls', 'yamlls', 'autotools_ls', 'marksman' }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
      capabilities = capabilities,
  })
end

-- lsps configured below: lua, go

lspconfig.lua_ls.setup {
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
lspconfig['gopls'].setup {
	capabilities = capabilities,
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_dir = lspconfig_util.root_pattern('go.work', 'go.mod', '.git'),
    settings = {
        gopls = {
            completeUnimported = true,
            -- enables placeholders with the function signature/parameters when autocompleted (e.g. make -> make(type, 0))
            usePlaceholders = true,
            -- there's much more static analysis tools provided by gopls
            -- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
            analyses = {
                unusedparams = true,
            },
        },
    },
}

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
-- lspconfig.yamlls.setup(cfg)
-- require('telescope').load_extension('yaml_schema')


