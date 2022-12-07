-- Define keymaps of Neovim  and Installed Plugins

local keymap = vim.keymap
local function map (mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then 
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


--Change leader key
vim.g.mapleader = " "

-- Map Esc to jk
map('i', 'jk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':noh<CR>')

-- Move around splits 
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration
map('n', '<leader>r', ':so %<CR>')

-- Fast Saving
map('n', '<leader>w', ':w<CR>')

-- Save and Quit Neovim
map('n', '<leader>q', ':wqall!<CR>')

-- Delete the buffer without closing the window
keymap.set("n", "<leader>bk", "<cmd>bprevious <bar> bdelete #<cr>", 
{silent = true,
desc = "delete buffer"})

--- Change to current directory
keymap.set("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", { desc = "change cwd" })

-- Change directory to Home
keymap.set("n", "<leader>pd", ":cd ~/<CR>")

-- Run Code
keymap.set("n", "<leader>cr", ":FloatermNew --autoclose=0 make % && ./%<CR>")


-- Buffer list
keymap.set("n", "<leader><", ":Telescop buffers<CR>")

-- TREE
keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>")

-- FloatTerm 
keymap.set("n", "<leader>ot", ":FloatermNew<CR>")

-- Telescope 
keymap.set("n", "<leader>ff", ":cd ~/ && Telescop find_files hidden=true<CR>")
keymap.set("n", "<leader>fr", ":Telescop oldfiles<CR>")
keymap.set("n", "<leader><", ":Telescop buffers<CR>")
