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
Plug 'alvan/vim-closetag'  "close html tags
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

" files to enable closetag
let g:closetag_filenames = '*.html,*.jsx,*.tsx'

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
nnoremap <silent> <Leader>s :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>b :!black %<CR>

"  insert mode
inoremap <C-e> <Esc>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

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
" lua << EOF
" require'lspconfig'.pyright.setup{}
" require'lspconfig'.rust_analyzer.setup{}
" EOF
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)  -- jump to declaration
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- jump to definition
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)  -- display hover info
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)  -- rename all references
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)  -- list all the references
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)  -- format

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
