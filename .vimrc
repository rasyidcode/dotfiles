let mapleader = " "

call plug#begin()

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" --- Filetype detection and indentation
" Enable filetype-based settings:
"   - Detect file types automatically
"   - Load filetype-spesific plugins (like for Python, PHP, etc.)
"   - Apply filetype-spesific indentation rules
" filetype plugin indent on

" --- Syntax highlighting ---
" Enable syntax highlighting for better code readability
" syntax on

" --- Line numbering ---
" Show absolute line number on the current line
set number
" Show relative line numbers on all other lines
" Useful for motions like 5j, 10k, etc.
set relativenumber

" --- Indentation settings ---
" Use spaces instead of tabs
set expandtab
" Number of spaces that a <Tab> counts for
set tabstop=4
" Number of spaces to use for each step of (auto)indent
set shiftwidth=4
" Make <BS> delete spaces as if they were tabs
set softtabstop=4
" Auto indent
set autoindent

" --- Encoding settings ---
" Always use UTF-8 internally
set encoding=utf-8
" Save new files as UTF-8
set fileencoding=utf-8

" --- Backup and swap settings ---
" Keep backup files
set backup
" Temporary backup while writing
set writebackup
" Enable swap file, useful if crash recovery
set swapfile

" --- Performance settings ---
" Reduce CursorHold delay and swap write interval
" Default is 4000ms (4s), which makes plugins like GitGutter/LSP feel slow.
" 300ms is a good balance between responsiveness and performance
set updatetime=300

" --- Navigate between window
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" --- Netraw settings
nnoremap <space>e :Lexplore<CR>
nnoremap <space>v :Vexplore<CR>
let g:netrw_keepdir = 0
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_winsize = 30

" --- Clipboard integration
set clipboard=unnamedplus

set background=dark
colorscheme slate

" --- Just adding comments
"  Another comment
"  My comment
