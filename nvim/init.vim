:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set splitbelow
:set splitright
:set noswapfile
":set autochdir
autocmd BufEnter * silent! lcd %:p:h
let mapleader=" "
:packadd termdebug
let g:termdebug_wide = 163
let g:cmake_link_compile_commands=1
set clipboard=unnamed

"Plugins go here 
call plug#begin()
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
"Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/voldikss/vim-floaterm' "floating terminal used for fff
Plug 'gelguy/wilder.nvim' "suggestions in the command line 
Plug 'dracula/vim', { 'as': 'dracula' } "Dracula theme 
Plug 'https://github.com/jiangmiao/auto-pairs' "Auto-completion of the brackets 
Plug 'https://github.com/mfussenegger/nvim-dap' "debugger 
Plug 'junegunn/fzf' , {'do' : { -> fzf#install() }} "fuzzy finder 
Plug 'junegunn/fzf.vim' "same as above 
Plug 'cdelledonne/vim-cmake' "cmake for generation of json files 
Plug 'antoinemadec/FixCursorHold.nvim' "needed for the fff in float terminal 
Plug 'junegunn/goyo.vim' "writing mode 
Plug 'https://github.com/folke/zen-mode.nvim' "zen mode like vscode 
Plug 'https://github.com/kblin/vim-fountain' "screenplay writing in fountain language
Plug 'https://github.com/vimwiki/vimwiki' "for writing notes
"Plug 'https://github.com/puremourning/vimspector' "Debugger
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" or                                , { 'branch': '0.1.x' }
Plug 'morhetz/gruvbox'
set encoding=UTF-8

call plug#end()

"custom commands 
:command Writemode colorscheme dracula | setlocal spell | Goyo 70 | set tw=70
:command Codemode colorscheme gruvbox | set nospell | Goyo!

"keys remapping 
inoremap jk <Esc>
nnoremap <F12> :e ~/.config/nvim/init.vim <CR>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
nnoremap <leader>. :Files<CR>
nnoremap <leader>< :Buffers<CR>
nnoremap <leader>tt :FloatermToggle <CR>
nnoremap <leader>ot :FloatermNew <CR> 
nnoremap <leader>of :FloatermNew fff<CR>
nnoremap <leader>cr :FloatermNew --autoclose=0 make %:r && ./%:r <CR>
nmap <leader>cg :CMakeGenerate<cr>
nmap <leader>cb :CMakeBuild<cr>
nnoremap <leader>b :Break<CR>
nnoremap <leader>s :Step<CR>
nnoremap <leader>n :Over<CR>
nnoremap <leader>f :Finish<CR>
nnoremap <leader>x :Stop<CR>
nnoremap <leader>r :Run<CR>
nnoremap <leader>r :Run<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
tnoremap <Esc> <C-\><C-n>
nmap <F8> :TagbarToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

:set completeopt-=preview " For No Previews

:colorscheme gruvbox

"NERDTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" use <tab> for trigger completion and navigate to the next complete item ->Coc
"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"inoremap <silent><expr> <Tab>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()		
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"

" Key bindings can be changed, see below
call wilder#setup({'modes': [':', '/', '?']})

