require('plugins')
require('mappings')
require('settings')
require('autocmds')

-- let g:gruvbox_contrast_dark='soft'
vim.cmd "colorscheme tokyonight"

-- Initialize Plugins

require('config.lualine')
require('Comment').setup()
require('config.gitsigns')
require('config.treesitter')
require('nvim-autopairs').setup()
require('config.indent_blankline')
require('which-key').setup()
-- require('colorizer').setup()
