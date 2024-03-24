require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
    ensure_installed = {
        -- LSP
        'ansible-language-server',
        'autotools-language-server',
        'bash-language-server',
        'docker-compose-language-service',
        'dockerfile-language-server',
        'gopls',
        'helm-ls',
        'jinja-lsp',
        'lua-language-server',
        'marksman',
        'pylyzer',
        'typescript-language-server',
        'rnix-lsp',
        'rust-analyzer',
        'sqls',
        'terraform-ls',
        'tflint',
        'yaml-language-server',
        -- Linters
        'ansible-lint',
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
        'goimports',
        'luaformatter',
        'sqlfmt',
        'yamlfmt',
    },
    auto_update = false
})

