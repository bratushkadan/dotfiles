require('mason').setup()
require('mason-lspconfig').setup()

-- LSP servers
require("lspconfig").lua_ls.setup {}
require("lspconfig").jinja_lsp.setup {}
require("lspconfig").helm_ls.setup {}
require("lspconfig").biome.setup {}
require("lspconfig").terraformls.setup {}
require("lspconfig").pylyzer.setup {}
require("lspconfig").rnix.setup {}
require("lspconfig").gopls.setup {}
require("lspconfig").bashls.setup {}
require("lspconfig").sqls.setup {}
require("lspconfig").ansiblels.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").yamlls.setup {}
require("lspconfig").autotools_ls.setup {}
require("lspconfig").marksman.setup {}

-- TODO: setup 1) linting; 2) formatting

