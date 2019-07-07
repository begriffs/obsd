" put the m in vim
set nocompatible

" use CTRL-G to show position
set noruler

filetype plugin indent on
syntax on

" decent colors that ship with vim
colorscheme pablo

" tabs for indentation, spaces for alignment
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

" fuzzy-find lite
nmap <Leader><space> :e **/

" quickfix shortcuts
nmap ]q :cnext<cr>
nmap ]Q :clast<cr>
nmap [q :cprev<cr>
nmap [Q :cfirst<cr>

" formatting is more common than Ex mode
nmap Q gq
vmap Q gq

" mouse can be useful, enable in normal mode
set mouse=n

" protect changes before writes
" default values of updatecount (200 keystrokes) and
" updatetime (4 seconds) are fine
set swapfile
" btw, mount on a fast fs when possible
set directory^=~/.vim/swap//

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

" protect against crash during partial-write
set writebackup
" but do not persist backup after successful write
" because we can mostly recover with our swap files
set nobackup
" whenever safe, use rename-and-write-new method for speed
set backupcopy=auto
" honoring 'backup//' requires vim patch-8.1.0251
set backupdir^=~/.vim/backup//
