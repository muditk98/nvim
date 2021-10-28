" General

" Plugins

lua require('plugins')
" let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox-material

lua require('settings')

map Y y$


autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby      " set podfiles to use ruby syntax



" Set number in insert and hybrid in normal
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END

au TextYankPost * silent! lua vim.highlight.on_yank()
