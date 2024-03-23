require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
    ensure_installed = {
        -- LSP
        'ansible-language-server',
        'autotools-language-server',
        'bash-language-server',
        'biome',
        'docker-compose-language-service',
        'dockerfile-language-server',
        'gopls',
        'helm-ls',
        'jinja-lsp',
        'lua-language-server',
        'marksman',
        'pylyzer',
        'rnix-lsp',
        'rust-analyzer',
        'sqls',
        'terraform-ls',
        'tflint',
        'yaml-language-server',
        -- Linters
        'ansible-lint',
        'biome',
        'jinja-lsp',
        'pylint',
        'salt-lint',
        'selene',
        'snyk',
        'staticcheck',
        'tflint',
        'yamllint',
        -- Formatters
        'autopep8',
        'biome',
        'goimports',
        'luaformatter',
        'sqlfmt',
        'yamlfmt',
    },
    auto_update = false
})

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

