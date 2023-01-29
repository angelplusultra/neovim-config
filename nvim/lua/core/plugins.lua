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
  use 'https://github.com/ellisonleao/gruvbox.nvim'
  use 'https://github.com/nvim-tree/nvim-tree.lua'
  use 'https://github.com/nvim-tree/nvim-web-devicons'
  use 'https://github.com/nvim-lualine/lualine.nvim'
  use  'https://github.com/nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use 'L3MON4D3/LuaSnip'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'https://github.com/terrortylor/nvim-comment'
  use 'https://github.com/xiyaowong/nvim-transparent'
  use 'folke/tokyonight.nvim'

  use 'https://github.com/prettier/vim-prettier'
  use 'sbdchd/neoformat'
  use 'https://github.com/vim-autoformat/vim-autoformat'
  use 'https://github.com/prettier/prettier'
  use 'https://github.com/windwp/nvim-ts-autotag'
use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
use 'https://github.com/airblade/vim-gitgutter'
use 'https://github.com/tpope/vim-fugitive'


use 'glepnir/dashboard-nvim'

    

  -- My plugins here'
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
