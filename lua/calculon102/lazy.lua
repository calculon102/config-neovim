local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- My own cheat-sheet
    'calculon102/cheatsheet.nvim',

    -- Auto close brackets
    {
        'm4xshen/autoclose.nvim',
    },

    -- Auto close HTML-tags
    {
        'windwp/nvim-ts-autotag',
        opts = {},
    },

    -- Fuzzy finder, especially for files
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    -- Theme
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },

    -- File explorer
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

    -- Formatter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-treesitter/playground',

    -- TODO map keys
    'mbbill/undotree',

    -- Git integration with "Git"-command
    'tpope/vim-fugitive',

    -- Code completions and Formatter
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    'skwee357/nvim-prose',
}

require("lazy").setup(plugins)
