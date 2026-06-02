" 2026 vimrc config

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

" --- General Settings ---
"syntax on			" Enable syntax highlighting
set number			" Show line numbers
set relativenumber		" Relative numbers help with jumping lines
set cursorline			" Highlight the current line
set clipboard=unnamedplus	" Use sytem clipboard
set noshowmode          " hide message from the bottom line

set encoding=utf-8

" Turn off backup and swp file
set nobackup
set nowritebackup
set noswapfile

" Reduce updatetime to 300ms to increase user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostic appear/become resolved
set signcolumn=yes

" --- C-Specific Indentation --- 
set tabstop=4			" Number of visual spaces per TAB
set softtabstop=4		" Number of spaces in tab when editing
set shiftwidth=4		" Tabs under smartindent
set expandtab			" Convert tabs to spaces
set smartindent			" Intelegent indentation for C
set cindent			" Spesific indentation for C-style languages

" --- Keybindings ---
let mapleader = " "

" --- Netraw settings
nnoremap <space>e :Lexplore<CR>
nnoremap <space>v :Vexplore<CR>
let g:netrw_keepdir = 0
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_winsize = 30

" Use gruvbox theme
set termguicolors
colorscheme gruvbox
set background=dark

" -- [vim-airline] --
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Force refresh
" imap <c-space> <Plug>(asyncomplete_force_refresh)
