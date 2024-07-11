local none_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

none_ls.setup({
    debug = true,
    sources = {
        -- gofumpt is a stricter version of "gofmt" none_ls.builtins.formatting.gofmt,
        none_ls.builtins.formatting.gofmt,
        none_ls.builtins.formatting.goimports,
        -- NOTE: goimports_reviser didn't work for me (in term of deleteting unused imports upon file save)
        -- none_ls.builtins.formatting.goimports_reviser,
        -- none_ls.builtins.formatting.golines -- confines line length (to 80 by default)
        none_ls.builtins.formatting.stylua,

        none_ls.builtins.formatting.black,
        none_ls.builtins.diagnostics.mypy,

        none_ls.builtins.diagnostics.yamllint,
        -- none_ls.builtins.formatting.yamlfmt,

        none_ls.builtins.diagnostics.terraform_validate,
        none_ls.builtins.formatting.terraform_fmt,

        none_ls.builtins.diagnostics.buf,
        none_ls.builtins.formatting.buf,

        none_ls.builtins.diagnostics.saltlint,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
