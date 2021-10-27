" General

" Plugins

call plug#begin(stdpath('data') . '/plugged')

    Plug stdpath('data') . '/swift-vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    " Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    " Plug 'machakann/vim-sandwich'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'wellle/targets.vim'
    Plug 'justinmk/vim-sneak'

call plug#end()

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
