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
 set mouse=a

 " set t_Co=256

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
     Plug 'vim-airline/vim-airline' " status bar
     Plug 'vim-airline/vim-airline' " status bar
     Plug 'vim-airline/vim-airline-themes'
     Plug 'vimwiki/vimwiki'
     " Plug 'altercation/vim-colors-solarized'
     " Plug 'shaunsingh/nord.nvim'
     Plug 'sheerun/vim-polyglot'
     Plug 'joshdick/onedark.vim'

call plug#end()

" onedark.vim override: Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
"  if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif

" hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256


colorscheme onedark
" colorscheme gruvbox
" colorscheme solarized
" colorscheme nord
" set background=dark

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0 "disable trailing whitespaces info 
let g:airline_section_y = ''
" let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
let g:airline_section_z = '%3p%% %3l/%L:%3v' "formats the line count 
" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" let g:airline_symbols.maxlinenr= ''
" Switch to your current theme
" let g:airline_theme = 'onedark'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

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
