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
    -- draw diagram with venn 
    use 'https://github.com/jbyuki/venn.nvim'

    --themes
    use 'https://github.com/GustavoPrietoP/doom-themes.nvim'

    -- language servers
    use 'https://github.com/williamboman/mason.nvim'
    use "williamboman/mason-lspconfig.nvim"

    -- lsp-signature
    use 'https://github.com/ray-x/lsp_signature.nvim'

	-- packer can manager itself
	use 'wbthomason/packer.nvim'

    -- icons
    use 'nvim-tree/nvim-web-devicons'

    --zen mode
    use 'https://github.com/folke/zen-mode.nvim'

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

    -- file browser telescope
    use { "nvim-telescope/telescope-file-browser.nvim" }

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

    -- sneak vim motions
    use 'justinmk/vim-sneak'

    -- projects management with telescope
    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
        require('telescope').load_extension('projects')
      end
    }
    -- which-key
    use {
      "folke/which-key.nvim",
      config = function()
      end
    }

    -- tree-sitter
    use 'https://github.com/nvim-treesitter/nvim-treesitter'

    -- lsp preview
    use 'vim-denops/denops.vim'
    use 'https://github.com/matsui54/ddc-nvim-lsp-doc'

    -- session management
    use 'https://github.com/Shatur/neovim-session-manager'

    -- fountain mode
    use 'https://github.com/kblin/vim-fountain'

    --use org-mode
    use {'nvim-orgmode/orgmode', config = function()
      require('orgmode').setup{}
    end
    }

    -- org bullets
        use {'akinsho/org-bullets.nvim', config = function()
      require('org-bullets').setup()
    end}

    -- findr incremental file searching
    use 'https://github.com/conweller/findr.vim'

    -- vim table
    use 'https://github.com/dhruvasagar/vim-table-mode'

    -- Automatically setup your configuration
     if packer_bootstrap then
    require('packer').sync()
  end
end)

