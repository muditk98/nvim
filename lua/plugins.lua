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
  use {
    fn.stdpath('data') .. '/swift-vim'
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'numToStr/Comment.nvim'

  use 'sainnhe/gruvbox-material'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    -- tag = 'release' -- To use the latest release
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
-- call plug#begin(stdpath('data') . '/plugged')

--     Plug 'tpope/vim-surround'
--     Plug 'tpope/vim-repeat'
--     Plug 'wellle/targets.vim'
--     Plug 'justinmk/vim-sneak'

-- call plug#end()
