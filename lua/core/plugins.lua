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
  use 'shaunsingh/nord.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      opt = true
    }
  }
  use 'nvim-treesitter/nvim-treesitter'
  use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.6',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use 'lukas-reineke/virt-column.nvim'

  -- Completition and LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use({
    "L3MON4D3/LuaSnip",
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    run = "make install_jsregexp"
  })
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "lukas-reineke/indent-blankline.nvim"

  -----------------------------------------------
  if packer_bootstrap then
    require('packer').sync()
  end
end)
