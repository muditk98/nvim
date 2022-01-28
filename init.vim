lua require('mappings')
lua require('plugins')
lua require('settings')
lua require('autocmds')

" let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox-material

" Initialize Plugins

lua require('config.lualine')
lua require('Comment').setup()
lua require('gitsigns').setup()
lua require('config.treesitter')
lua require('nvim-autopairs').setup()
lua require('config.indent_blankline')
" lua require('colorizer').setup()
