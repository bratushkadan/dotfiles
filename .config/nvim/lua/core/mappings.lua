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
Nm("<leader>fb", ":Telescope buffers<CR>")
Nm("<leader>fh", ":Telescope help_tags<CR>")

-- Bufferline and buffer mappings
-- set('n', '<leader>x', ':BufferLinePickClose<CR>')
Nm("<leader>{", ":BufferLineCyclePrev<CR>")
Nm("<leader>}", ":BufferLineCycleNext<CR>")
Nm("<leader>M", ":BufferLinePick<CR>")
Nm("<leader>X", ":bd<CR>")
Nm("<leader>s", ":BufferLineSortByTabs<CR>")

-- Motions
Nm("<C-d>", "<C-d>zz")
Nm("<C-u>", "<C-u>zz")
Nm("n", "nzzzv")
Nm("N", "Nzzzv")
Vm("<leader>p", '"_dP')
