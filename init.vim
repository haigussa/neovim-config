set nocompatible
filetype plugin on
syntax on

set tabstop=4 softtabstop=4
 set shiftwidth=4
 set expandtab
 set smartindent
 set smartcase
 set directory^=$HOME/.vim/tmp//
 set incsearch
 set colorcolumn=120
 set nu
 set relativenumber
 set scrolloff=5
 set signcolumn=yes

 call plug#begin('~/.config/nvim/plugged')

     Plug 'neoclide/coc.nvim', {'branch': 'release'}
     Plug 'gruvbox-community/gruvbox'
     Plug 'tpope/vim-fugitive'
     Plug 'preservim/nerdtree'
     Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
     Plug 'MaxMEllon/vim-jsx-pretty'
     Plug 'ryanoasis/vim-devicons'
     Plug 'tpope/vim-surround'
     Plug 'alvan/vim-closetag'
     Plug 'tpope/vim-commentary'
     Plug 'vimwiki/vimwiki'
     Plug 'altercation/vim-colors-solarized'


call plug#end()

colorscheme gruvbox
" colorscheme solarized
set background=dark

inoremap jk <ESC>
map <silent> <C-n> :NERDTreeFocus<CR>
" source $HOME/.config/nvim/plug-config/coc.vim

" make escape work in terminal
tnoremap <Esc> <C-\><C-n>


 " set <space> as the leader for mappings
let mapleader=" "  
nnoremap <space> <nop>

" buffer and window mappings
nmap <leader>w <c-w>
nmap <leader><tab> <c-^>

" copy to clipboard
vnoremap  <leader>y  "+y

" past from clipboard
nnoremap <leader>p "+p

" run prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')


" vimwiki - use markdown
let g:vimwiki_list = [{
            \ 'path': '~/vimwiki/notes/',
            \ 'syntax': 'markdown', 'ext': '.md',
            \ 'diary_header': 'Daily Syncs',
            \ 'auto_generate_tags': 1,
            \ 'diary_rel_path': 'daily/',
            \}]


let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-html', 
  \ 'coc-css', 
  \ 'coc-emmet', 
  \ ]


" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.

let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.

let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js,tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.

let g:closetag_xhtml_filetypes = 'html,xhtml,jsx,js,tsx'


" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)

let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

