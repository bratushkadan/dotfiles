require("nvim-treesitter.configs").setup({
    ensure_installed = {
        -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#available-modules
        "bash",
        "css",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "helm",
        "html",
        "ini",
        "java",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "proto",
        "python",
        "sql",
        "terraform",
        "tmux",
        "toml",
        "typescript",
        "xml",
        "yaml",
    },

    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})

vim.filetype.add({
    extension = {
        gotmpl = "gotmpl",
    },
    pattern = {
        [".*/templates/.*%.tpl"] = "helm",
        [".*/templates/.*%.ya?ml"] = "helm",
        ["helmfile.*%.ya?ml"] = "helm",
    },
})
