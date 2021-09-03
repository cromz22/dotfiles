"-plugins-"
call plug#begin('~/.vim/plugged')
Plug 'tyru/caw.vim' " auto commenting
call plug#end()

"--general--"
syntax enable
set number
"set cursorline
set virtualedit=onemore
set showmatch "show corespondent parenthesis
set autoindent "Enter pressed, indent same space as the previous row
set tabstop=4 "how many spaces are counted as a tab
set shiftwidth=4 "how many spaces are inserted when indenting
set incsearch "begin searching as soon as a character is input
set hlsearch
set mouse=a
"set title "show title of the document
set nowrap
" set clipboard=unnamed "yanked text to clipboard
set backspace=indent,eol,start
set shortmess-=S

"--encoding--"
set encoding=utf-8 " internal
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp " when reading files
set fileformats=unix,dos,mac
set fileencoding=utf-8 " when writing files
set fileformat=unix

"--colors--"
colorscheme desert

"--key mapping--"
let mapleader = "\<Space>"

"-normal mode-"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
"nnoremap j gj
"nnoremap k gk
nnoremap <silent> <C-e> :nohlsearch<CR><Esc>
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
"maximize selected window
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

nnoremap <C-h> b

"-insert mode-"
function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

inoremap <C-e> <Esc>
inoremap ( ()<Left>
inoremap <expr> ) ClosePair(')')
inoremap { {}<Left>
inoremap <expr> } ClosePair('}')
inoremap [ []<Left>
inoremap <expr> ] ClosePair(']')
"inoremap " ""<Left>
"inoremap ' ''<Left>
"ClosePair not successful...
inoremap {<Enter> {}<Left><CR><ESC><S-o>

"-visual mode-"
vnoremap <C-e> <Esc>
vnoremap y y`]
vnoremap p p`]

"-auto commenting with space+c-"
nmap <Leader>c <Plug>(caw:zeropos:toggle)
vmap <Leader>c <Plug>(caw:zeropos:toggle)
