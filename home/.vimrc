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

" I can figure it out w/o a beep
set belloff=all

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

map <silent> <F8> :copen<cr>
map <silent> <F7> :cclose<cr>

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

" show subfolders as ascii tree
let g:netrw_liststyle = 3
" hide help banner -- you can show it with 'I'
let g:netrw_banner = 0

" Protect changes before writes.  Default values of
" updatecount (200 " keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
" hint: mount on a fast fs when possible
set directory^=~/.vim/swap//

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
	" consolidate the writebackups -- not a big
	" deal either way, since they usually get deleted
	set backupdir^=~/.vim/backup//
end

" shortcuts for 3-way merge
map <Leader>1 :diffget LOCAL<CR>
map <Leader>2 :diffget BASE<CR>
map <Leader>3 :diffget REMOTE<CR>
