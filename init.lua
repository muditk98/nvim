require('plugins')
require('mappings')
require('settings')
require('autocmds')

-- let g:gruvbox_contrast_dark='soft'
vim.cmd "colorscheme gruvbox-material"

-- Initialize Plugins

vim.notify = require('notify')
require('config.telescope')
require('config.lualine')
require('Comment').setup()
require('config.gitsigns')
require('config.treesitter')
require('nvim-autopairs').setup()
require('config.indent_blankline')
require('which-key').setup()
require('git-conflict').setup()
