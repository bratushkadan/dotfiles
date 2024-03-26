require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
	  -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#available-modules
	  "bash",
	  "dockerfile",
      -- "hcl",
	  "go",
	  "gomod",
	  "gosum",
	  "gotmpl",
	  "gowork",
	  "helm",
	  "java",
	  "javascript",
	  "json",
	  "lua",
	  "make",
	  "markdown",
	  "python",
	  "rust",
	  "sql",
	  "terraform",
	  "typescript",
	  "xml",
	  "yaml"
  },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
