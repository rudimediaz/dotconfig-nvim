local startupfn = function(use)
    -- packer
    use 'wbthomason/packer.nvim'
    -- auto pairs
    -- use 'jiangmiao/auto-pairs'
    use {
	    "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- lua line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- tree sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
    }
    -- lsp installer
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }
    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    -- emmet
    use 'mattn/emmet-vim'
    -- nvimtree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- theme
    use 'EdenEast/nightfox.nvim'
    use 'Mofiqul/adwaita.nvim'
    -- prettier
    use 'sbdchd/neoformat'
    -- svelte
    use 'othree/html5.vim'
    use 'pangloss/vim-javascript'
    use {
        'evanleck/vim-svelte',
        branch = 'main'
    }
    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {{ 'nvim-lua/plenary.nvim' }}
    }

end

return require('packer').startup(startupfn)
