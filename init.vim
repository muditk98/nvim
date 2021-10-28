lua require('plugins')
lua require('settings')

" let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox-material
map Y y$


autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby      " set podfiles to use ruby syntax



" Set number in insert and hybrid in normal
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END

au TextYankPost * silent! lua vim.highlight.on_yank()


" Initialize Plugins

lua require('plugins.lualine')
lua require('plugins.comment')
lua require('plugins.gitsigns')


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
