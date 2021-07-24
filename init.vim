set nocompatible 
filetype off
syntax on
set tabstop=4 softtabstop=4
 set shiftwidth=4
 set expandtab
 set smartindent
 set smartcase
 set directory^=$HOME/.vim/tmp//
 set incsearch
 set colorcolumn=80
 set relativenumber
 set scrolloff=5
 set signcolumn=yes

 call plug#begin('~/.config/nvim/plugged')

 Plug 'gruvbox-community/gruvbox'
 Plug 'tpope/vim-fugitive'

call plug#end()

colorscheme gruvbox
