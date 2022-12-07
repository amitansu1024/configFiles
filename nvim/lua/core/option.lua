local g = vim.g
local opt = vim.opt

-- General
opt.mouse = 'a'
opt.clipboard  = 'unnamedplus'
opt.swapfile = false
opt.completeopt = 'menuone,menu,noselect'
opt.relativenumber = true
opt.pumheight = 10

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
