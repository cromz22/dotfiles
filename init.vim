" plugins 
call plug#begin()
Plug 'tyru/caw.vim'  " auto commenting
Plug 'preservim/nerdtree'  " file tree
Plug 'neovim/nvim-lspconfig'  " language server
Plug 'jiangmiao/auto-pairs'  " auto complete brackets
Plug 'cocopon/iceberg.vim'  " color scheme
Plug 'blueyed/vim-diminactive'  " dim when focus is lost
Plug 'tmux-plugins/vim-tmux-focus-events'  " share focus info with tmux
Plug 'neovim/nvim-lspconfig'  " language server
call plug#end()

" general
syntax enable
set number
"set cursorline
set virtualedit=onemore
set showmatch  " show corespondent parenthesis
set autoindent  " Enter pressed, indent same space as the previous row
set tabstop=4  " how many spaces are counted as a tab
set shiftwidth=4  " how many spaces are inserted when indenting
set incsearch  " begin searching as soon as a character is input
set hlsearch
set mouse=a
"set title  " show title of the document
set nowrap
set clipboard=unnamed  " yanked text to clipboard
set backspace=indent,eol,start

" encoding
set encoding=utf-8  " internal
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp  " when reading files
set fileformats=unix,dos,mac
set fileencoding=utf-8  " when writing files
set fileformat=unix

" colorscheme
colorscheme iceberg

" focus
let g:diminactive_enable_focus = 1

" key mapping
let g:mapleader = "\<Space>"

"  normal mode
nnoremap <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap j gj
nnoremap k gk
nnoremap <silent> <C-e> :nohlsearch<CR><C-l><Esc>
nnoremap <Leader>o o<Esc>
nnoremap <S-h> ^
nnoremap <S-l> $
nnoremap s <Nop>
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap <silent> <leader>t :NERDTreeToggle<CR>

"  insert mode
inoremap <C-e> <Esc>

"  visual mode
vnoremap <C-e> <Esc>
vnoremap y y`]
vnoremap p p`]

"  auto commenting with space + c
nmap <Leader>c gcc
vmap <Leader>c gcc

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" language server
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup{}
EOF
