lua require('mappings')
lua require('plugins')
lua require('settings')

" let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox-material

autocmd BufNewFile,BufRead Podfile,*.podspec setlocal filetype=ruby      " set podfiles to use ruby syntax

" Set number in insert and hybrid in normal
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END

au TextYankPost * silent! lua vim.highlight.on_yank()
au VimEnter * if &diff | execute 'windo set wrap' | endif


" Initialize Plugins

lua require('config.lualine')
lua require('Comment').setup()
lua require('gitsigns').setup()
lua require('config.treesitter')
lua require('nvim-autopairs').setup()
lua require('config.indent_blankline')
" lua require('colorizer').setup()
