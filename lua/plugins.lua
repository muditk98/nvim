local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end


return require('packer').startup(function(use)
  -- Packer can manage itself https://github.com/wbthomason/packer.nvim
  use 'wbthomason/packer.nvim'
-- {{ File type syntax
  use { fn.stdpath('data') .. '/swift/utils/vim' } -- swift
  use 'krisajenkins/Cocoa-Strings' -- .strings
  use 'martinda/Jenkinsfile-vim-syntax' -- Jenkinsfile
-- }}

-- {{ Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use 'tpope/vim-fugitive'
-- }}

-- {{ Themes
  use 'sainnhe/gruvbox-material'
  use 'folke/tokyonight.nvim'
-- }}

-- {{ Candy
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'norcalli/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'
-- }}

  use 'numToStr/Comment.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tjdevries/train.nvim'
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'}
  }
  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- use 'p00f/nvim-ts-rainbow'

  use 'windwp/nvim-autopairs'
  use 'tweekmonster/startuptime.vim'
  use 'folke/which-key.nvim'
  use 'ggandor/lightspeed.nvim'
  use 'FooSoft/vim-argwrap'
  use {'kevinhwang91/nvim-bqf', ft = 'qf'}
  if packer_bootstrap then
    require('packer').sync()
  end
end)
-- call plug#begin(stdpath('data') . '/plugged')

--     Plug 'wellle/targets.vim'

-- call plug#end()
