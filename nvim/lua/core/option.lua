local g = vim.g
local opt = vim.opt

-- General
opt.mouse = 'a'
opt.clipboard  = 'unnamedplus'
opt.swapfile = false
opt.relativenumber = true
opt.pumheight = 10
opt.pumwidth = 5
opt.autochdir = true
vim.cmd('colorscheme gruvbox')
vim.cmd('packadd termdebug')
vim.cmd('let g:sneak#label=1')
vim.o.completeopt = "menuone,noselect"
vim.opt.foldenable = false

-- Neovim UI
opt.number = true
opt.showmatch = true
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.linebreak = true
opt.laststatus = 3

-- Tabs, indent
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- Memory, CPU
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240
opt.updatetime = 250

-- Disable nvim intro
opt.shortmess:append "sI"

-- Floaterm
g.floaterm_wintype = "split"
g.floaterm_height = 10

-- gdb
g.termdebug_wide = 10


vim.cmd([[
au FileType fountain ZenMode | set foldmethod=manual tw=68 spell
]])
