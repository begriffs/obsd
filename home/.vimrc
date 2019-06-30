set nocompatible

" use CTRL-G to show position
set noruler

filetype plugin indent on
syntax on

" decent colors that ship with vim
colorscheme pablo

set backupdir=/tmp
set backupext=~

set noexpandtab
set tabstop=4
set shiftwidth=4

" wrapping can be confusing
set nowrapscan

" be smart about case
set ignorecase
set smartcase

set backspace=eol,indent,start

" real make
map <silent> <F5> :make<cr><cr><cr>
" GNUism, for building postgres
map <silent> <s-F5> :make -w<cr><cr><cr>

nmap ]q :cnext<cr>
nmap ]Q :clast<cr>
nmap [q :cprev<cr>
nmap [Q :cfirst<cr>

" formatting is more common than Ex mode
nmap Q gq
vmap Q gq
