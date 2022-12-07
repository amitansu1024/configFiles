-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install Plugins
return require('packer').startup(function()
	-- packer can manager itself
	use 'wbthomason/packer.nvim'

    -- File explorer
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Autopair
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup{}
        end
    }

    -- Tags
    use 'preservim/tagbar'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- AutoComplete
    use 'hrsh7th/nvim-cmp'

    -- Autocompletion with LSPs
    use 'hrsh7th/cmp-nvim-lsp'

	-- colorscheme
	use 'gruvbox-community/gruvbox'

    -- snippets
    use 'hrsh7th/vim-vsnip'

    -- DashBoard
    use 'glepnir/dashboard-nvim'

    -- Commenter
    use 'tpope/vim-commentary'

    -- Lualine
    use 'nvim-lualine/lualine.nvim'

    -- FloatTerm
    use 'voldikss/vim-floaterm'

    -- Telescope File finder
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- lf wrapper
    use 'ptzz/lf.vim'

    -- fugitive for git

    -- Automatically setup your configuration
     if packer_bootstrap then
    require('packer').sync()
  end
end)

