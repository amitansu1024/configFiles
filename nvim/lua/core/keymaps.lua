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

-- -- Map Esc to jk
map('i', 'jk', '<Esc>')

-- -- Clear search highlighting with <leader> and ch
map('n', '<C-c>', ':noh<CR>')

-- -- Move around splits 
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- lazygit
keymap.set("n", "<leader>gg", ":FloatermNew --wintype=float --height=0.8 --width=0.9 --autoclose=2 lazygit<CR>", {desc = "lazy git"})
 
-- Go to website directory
keymap.set("n", "<leader><CR>", ":e ~/.projects/website/content<CR>", {desc = "open website"})

-- -- Fast Saving
keymap.set("n", "<leader>bk", ":w<CR>", {desc = "write"})

-- -- Save and Quit Neovim
keymap.set("n", "<leader>nq", ":wqa!<CR>", {desc = "save and quit"})

-- -- Delete the buffer without closing the window
keymap.set("n", "<leader>bk", "<cmd>bprevious <bar> bdelete #<cr>", {desc = "buffer kill"})

-- --- Change to current directory
keymap.set("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", {desc = "to current directory"})

-- -- Change directory to Home
keymap.set("n", "<leader>ch", ":cd ~/<CR>", {desc = "to home directory"})

-- -- TREE
keymap.set("n", "<C-x>", ":NvimTreeToggle<CR>")

-- -- FloatTerm 
keymap.set("n", "<leader>ot", ":FloatermNew<CR>", {desc = "terminal"})

-- -- Floaterm File navigation with findr
keymap.set("n", "<leader>.", ":Findr<CR>", {desc = "navigate files"})

-- change from terminal mode to normal mode
keymap.set("t", "jk", "<C-\\><C-N>")

-- -- to the config files
keymap.set("n", "<leader>nc", ":e ~/.config/nvim/lua/<CR>", {desc = "config files"})


-- -- debugger
keymap.set("n", "<leader>od", ":Termdebug ", {desc = "debugger"}) -- open the debugger
keymap.set("n", "<leader>dr", ":Run ", {desc = "run"}) -- Run the debugger
keymap.set("n", "<leader>db", ":Break<CR>", {desc = "set breakpoints"}) -- Set breakpoints
keymap.set("n", "<leader>dd", ":Clear<CR>", {desc = "clear breakpoints"}) -- Clear the breakpoint
keymap.set("n", "<leader>dn", ":Over<CR>", {desc = "to next breakpoint"}) -- Go to the next breakpoint
keymap.set("n", "<leader>dc", ":Continue<CR>", {desc = "continue"}) -- Continue to the next breakpoint
keymap.set("n", "<leader>dq", ":Finish<CR>", {desc = "quit"}) -- Exit

-- Session
keymap.set("n", "<leader>os", ":SessionManager load_session<CR>", {desc = "sessions"})
keymap.set("n", "<leader>sl", ":SessionManager load_last_session<CR>", {desc = "recent sessions"})
keymap.set("n", "<leader>sa", ":SessionManager save_current_session<CR>", {desc = "add current session"})

-- Telescope 
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {desc = "find files"})
keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", {desc = "recent files"})
keymap.set("n", "<leader><", ":Telescope buffers<CR>", {desc = "buffers"})
keymap.set("n", "<leader>gc", ":Telescope git_commits<CR>", {desc = "git commits"})
keymap.set("n", "<leader>gs", ":Telescope git_status<CR>", {desc = "git status"})
keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", {desc = "git branches"})
keymap.set("n", "<leader>op", ":Telescope projects<CR>", {desc = "projects"})
keymap.set("n", "<leader>,", ":Telescope file_browser", {desc = "file navigate"})

-- Code
keymap.set("n", "<leader>cr", ":FloatermNew --autoclose=0 make CXXFLAGS='-g' %:r && ./%:r<CR>", {desc = "compile and run"})
keymap.set("n", "<leader>cc", ":FloatermNew --autoclose=0 make CXXFLAGS='-g'", {desc = "compile"})

vim.cmd('let g:lf_map_keys = 0')
