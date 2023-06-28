local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter' -- syntax highlighting
  use {
    'nvim-telescope/telescope.nvim',  -- fuzzy finder
    tag = '0.1.1',
    requires = {{'nvim-lua/plenary.nvim'}}  -- required dependency for telescope
  }
  -- lsp and mason
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- nvim-autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- which-key plugin
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  }

  -- indent-blankline plugin
  use "lukas-reineke/indent-blankline.nvim"

  -- oil 
  use "stevearc/oil.nvim"
    

  -- color theme
  use {"catppuccin/nvim", as = "catppuccin"}

  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup({theme="evil"})
    end
    }

    -- Hrsh7th Code Completion Suite
    use 'hrsh7th/nvim-cmp' 
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'
    -- toggle terminal
    use 'akinsho/toggleterm.nvim'
    -- TODO comments
    use {
      "folke/todo-comments.nvim",
      dependencies = {"nvim-lua/plenary.nvim"},
      config = function () require("todo-comments").setup{} end
    }

    -- Comments: gcc to line toggle current line; gbc block comment (it only works in normal mode)
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }
    use({
      "utilyre/barbecue.nvim",
      tag = "*",
      requires = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
      },
      after = "nvim-web-devicons", -- keep this if you're using NvChad
      config = function()
        require("barbecue").setup()
      end,
    })

    -- hop

    use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
      }

    -- Illuminate
    use {
      'RRethy/vim-illuminate'
    }

  use {
    'simrat39/symbols-outline.nvim'
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
