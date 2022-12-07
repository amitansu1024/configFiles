-- Define keymaps of Neovim  and Installed Plugins

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
map('n', '<leader>c', 'nohl<CR>')

-- Move around splits 
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration
map('n', '<leader>r', ':so %<CR>')

-- Fast Saving
map('n', '<leader>s', ':w<CR>')

-- Save and Quit Neovim
map('n', '<leader>q', ':wqall!<CR>')
