-- set podfiles to use ruby syntax
vim.cmd("au BufNewFile,BufRead Podfile,*.podspec setlocal filetype=ruby")

-- highlight on yank
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

-- Wrap difftool windows
vim.cmd("au VimEnter * if &diff | execute 'windo set wrap' | endif")

-- Set number in insert and hybrid in normal
vim.cmd([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END
]])
