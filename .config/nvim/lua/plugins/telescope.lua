require('telescope').setup({
    -- https://www.reddit.com/r/neovim/comments/16ikt0q/telescope_live_grep_search_some_hidden_files/?rdt=52142
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "__pycache__",
            "package-lock.json",
            ".git",
            ".venv",
            -- work
            "projects/webview/specs",
        }
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            additional_args = function(_)
                return { '--hidden' }
            end
        },
    },
    extensions = {
       fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
    }
})
require('telescope').load_extension('fzf')

