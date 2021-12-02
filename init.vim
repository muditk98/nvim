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


" Initialize Plugins

lua require('config.lualine')
lua require('Comment').setup()
lua require('gitsigns').setup()
lua require('config.treesitter')


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
