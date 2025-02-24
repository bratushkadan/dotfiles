vim.g.mapleader = " "

local set = vim.keymap.set

local function createMapper(mode)
    return function(key, command)
        set(mode, key, command, { noremap = true })
    end
end

-- Normal
Nm = createMapper("n")
-- Insert
Im = createMapper("i")
-- Visual
Vm = createMapper("v") -- "x" value is an alias for value "v", or "visual mode"
-- Terminal
Tm = createMapper("t")

-- Buffers, Windows and Tabs: https://learnvim.irian.to/basics/buffers_windows_tabs
-- set("n", "<leader>T", ":tabnew<CR>", { noremap = true })
Nm("<leader>T", ":tabnew<CR>")

-- Neotree
Nm("<leader>e", ":Neotree reveal<CR>")
Nm("<leader>b", ":Neotree toggle left<CR>")
Nm("<leader>o", ":Neotree float focus<CR>")

-- Telescope
Nm("<leader>ff", ":Telescope find_files<CR>")
Nm("<leader>fg", ":Telescope live_grep<CR>")
Nm("<leader>fs", ":Telescope live_grep_args<CR>")
Nm("<leader>fhs", ":Telescope live_grep_args<CR>--hidden --no-ignore ") -- include hidden files in search
Nm("<leader>fes", ":Telescope live_grep_args<CR>-e \\<\\><esc>hi") -- search for exact word
Nm("<leader>fhes", ":Telescope live_grep_args<CR>-. -e \\<\\><esc>hi") -- search for exact word (include hidden files)
Nm("<leader>fds", ":Telescope live_grep_args<CR>-g ") -- search in directory (glob)
Nm("<leader>fhds", ":Telescope live_grep_args<CR>-. -g ") -- search in hidden directory (glob)
Nm("<leader>fts", ":Telescope live_grep_args<CR>-t ") -- search for file of type
Nm("<leader>fb", ":Telescope buffers<CR>")
Nm("<leader>fh", ":Telescope help_tags<CR>")

-- GBrowse
Vm("<leader>G", ":GBrowse<CR>") -- open in browser

-- Bufferline and buffer mappings
-- set('n', '<leader>x', ':BufferLinePickClose<CR>')
Nm("<S-Left>", ":BufferLineCyclePrev<CR>")
Nm("<S-Right>", ":BufferLineCycleNext<CR>")
Nm("<leader>CO", ":BufferLineCloseOthers<CR>")
Nm("<leader>M", ":BufferLinePick<CR>")
Nm("<leader>x", ":bd<CR>")
Nm("<leader>s", ":BufferLineSortByTabs<CR>")

-- Motions
-- search exact word
Nm("<leader>/", "/\\<\\><left><left>")
Nm("<leader>?", "?\\<\\><left><left>")
Nm("<C-d>", "<C-d>zz")
Nm("<C-u>", "<C-u>zz")
Nm("n", "nzzzv")
Nm("N", "Nzzzv")
Vm("<leader>p", '"_dP')

-- Go
Nm("<leader>ctx", "actx context.Context")
Nm("<leader>ct,x", "actx context.Context, ")
Nm("<leader>ge", "_Cif err := <Esc>pA; err != nil {<Esc>o}<Esc>Oreturn ")

-- Harpoon
Nm("<S-h><S-s>", ":Telescope harpoon marks<CR>")
Nm("<S-h><S-m>", ':lua require("harpoon.mark").add_file()<CR>')
Nm("<S-h><S-b>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
Nm("<S-h><S-n>", ':lua require("harpoon.ui").nav_next()<CR>')
Nm("<S-h><S-p>", ':lua require("harpoon.ui").nav_prev()<CR>')
