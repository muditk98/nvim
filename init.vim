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

set termguicolors   " For gruvbox theme
" let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox-material

set confirm     " Confirm changes on quit
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=2	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab
 

" set tildeop     " ~ Tilde is an operator and must be followed by motions
set showcmd     " Show commands as they are being typed
set scrolloff=3   " Minimum lines above/below cursor

set hidden " Buffers are active in background. Be careful of :q!

" Natural splits
set splitright
set splitbelow

map Y y$


autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby      " set podfiles to use ruby syntax



set number	" Show line numbers
" set relativenumber " Show relative line numbers
" Set number in insert and hybrid in normal
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END

au TextYankPost * silent! lua vim.highlight.on_yank()
