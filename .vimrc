" plugins
call plug#begin('~/.vim/plugged')
Plug 'tyru/caw.vim'  " auto commenting
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
set nowrap
set backspace=indent,eol,start
set shortmess-=S  " show matched number when searching

" encoding
set encoding=utf-8  " internal
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp  " when reading files
set fileformats=unix,dos,mac
set fileencoding=utf-8  " when writing files
set fileformat=unix

" colors
colorscheme desert

" key mapping
let g:mapleader = "\<Space>"

"  normal mode
nnoremap <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q<CR>
"nnoremap j gj
"nnoremap k gk
nnoremap <Leader>o o<Esc>
nnoremap <S-h> ^
nnoremap <S-l> $
nnoremap <silent> <Leader>s :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap p p`]

"  insert mode
function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

inoremap ( ()<Left>
inoremap <expr> ) ClosePair(')')
inoremap { {}<Left>
inoremap <expr> } ClosePair('}')
inoremap [ []<Left>
inoremap <expr> ] ClosePair(']')
inoremap {<Enter> {}<Left><CR><ESC><S-o>

inoremap <C-b> <Left>
inoremap <C-f> <Right>

"  visual mode
vnoremap y y`]
vnoremap p p`]

"  auto commenting with space + c
nmap <Leader>c gcc
vmap <Leader>c gcc
