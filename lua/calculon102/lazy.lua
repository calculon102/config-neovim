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

    -- Theme
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },

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
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "nvim-mini/mini.icons" },
        opts = {}
    },

    -- Theme
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        --         config = function()
        --             vim.cmd('colorscheme rose-pine')
        --         end
    },

    {
        "mason-org/mason.nvim",
        opts = {}
    },

    -- File explorer
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

    -- Formatter

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate'
    },

    -- Git integration with "Git"-command
    'tpope/vim-fugitive',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Word-Count
    'skwee357/nvim-prose',

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    }
}

require("lazy").setup(plugins)
