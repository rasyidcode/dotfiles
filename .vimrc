" 2026 vimrc config

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" --- General Settings ---
"syntax on			        " Enable syntax highlighting
set number			        " Show line numbers
set relativenumber		    " Relative numbers help with jumping lines
set cursorline			    " Highlight the current line
set clipboard=unnamedplus	" Use sytem clipboard
set noshowmode              " hide message from the bottom line
set mouse=a                 " enable mouse

set encoding=utf-8

" --- Backup and swap settings ---
set backup                  " Keep backup files
set writebackup             " Temporary backup while writing
set swapfile                " Enable swap file, useful if crash recovery

set updatetime=300          " Reduce updatetime to 300ms to increase user experienced

set signcolumn=yes          " Always show the signcolumn, otherwise it would shift the text each time diagnostic appear/become resolved

" Searching
set ignorecase              " Makes searches case-insentive by default
set smartcase               " Automatically switches to case-sensitive
set incsearch               " Enables incremental search
set hlsearch                " Highlights all matches found in the active buffer

" --- C-Specific Indentation --- 
set tabstop=4			    " Number of visual spaces per TAB
set softtabstop=4		    " Number of spaces in tab when editing
set shiftwidth=4		    " Tabs under smartindent
set expandtab			    " Convert tabs to spaces
set smartindent			    " Intelegent indentation for C
set cindent			        " Spesific indentation for C-style languages

" --- Keybindings ---
let mapleader = " "

" --- Netrw settings
let g:netrw_keepdir = 1         " Preserved the project root
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0    " Re-use the same window when opening a file

" Hide dotfiles and swap files by default (press 'a' to toggle)
let g:netrw_list_hide = '.*\.sw[a-p]$,.*\.bak$,\~$'
let g:netrw_hide = 1

nnoremap <leader>e :Explore<CR>

autocmd FileType netrw setlocal bufhidden=wipe  " Wipe Netrw directory buffers when leaving them

" --- Theming ---
set termguicolors
colorscheme slate " Use gruvbox theme
set background=dark

autocmd VimEnter * ++nested colorscheme gruvbox

" --- vim-airline/vim-airline ---
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Force refresh
" imap <c-space> <Plug>(asyncomplete_force_refresh)

let g:lsp_diagnostic_enabled = 1 " Enable diagnostic

" --- prabirshrestha/asyncomplete.vim ---
let g:asyncomplete_auto_popup = 0

imap <C-Space>  <Plug>(asyncomplete_force_refresh)
imap <C-@>      <Plug>(asyncomplete_force_refresh)

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" lsp mapping
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gx <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> gf <plug>(lsp-document-format)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" folding
"set foldmethod=expr
"    \ foldexpr=lsp#ui#vim#folding#foldexpr()
"    \ foldtext=lsp#ui#vim#folding#foldtext()
"

" fuzzy finder settings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fb :BLines<CR>
nnoremap <leader>fr :Rg<CR>

" buffer navigate
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
