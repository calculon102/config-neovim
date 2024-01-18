-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder, especially for files
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Theme
  use ({ 
	'rose-pine/neovim', as = 'rose-pine',
	config = function()
		vim.cmd('colorscheme rose-pine')
	end
  })

  -- File explorer
  use ( 'nvim-tree/nvim-tree.lua' )
  use ( 'nvim-tree/nvim-web-devicons' )

  -- Formatter
  use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
  use ( 'nvim-treesitter/playground' )

  -- Quick file switch, TODO Upgrade to v2 and map keys
  use ( 'theprimeagen/harpoon' )

  -- TODO map keys
  use ( 'mbbill/undotree' )

  -- TODO What is this?
  use ( 'tpope/vim-fugitive' )

  -- Code completions and Formatter
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }	
end)
