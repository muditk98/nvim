require('mappings')
require('plugins')
require('settings')
require('autocmds')

-- let g:gruvbox_contrast_dark='soft'
vim.cmd "colorscheme gruvbox-material"

-- Initialize Plugins

require('config.lualine')
require('Comment').setup()
require('config.gitsigns')
require('config.treesitter')
require('nvim-autopairs').setup()
require('config.indent_blankline')
-- require('colorizer').setup()
