syntax on
filetype indent on

set encoding=utf-8

set noexpandtab
set tabstop=4
set shiftwidth=4

set cindent
set cino="Ls,:0,l1,t0,(s,U1,W4"
set formatoptions=croq

set backspace=eol,indent,start
set noswapfile

inoremap `in <esc>0i#include <<esc>A><Enter>
inoremap `iN <esc>0i#include "<esc>A"<Enter>

inoremap `M int main(int argc, char **argv)<Enter>{<Enter>return 0;<Enter>}<Esc>2kA<Enter>
inoremap `m int main(void)<Enter>{<Enter>return 0;<Enter>}<Esc>2kA<Enter>

inoremap `if <esc>0wiif (<esc>A)<Enter>{<Enter>}<Esc>kA<Enter>
inoremap `ie <esc>0wiif (<esc>A)<Enter>{<Enter>}<Enter>else<Enter>{<Enter>}<Esc>4kA<Enter>
inoremap `fo for (<esc>A)<Enter>{<Enter>}<Esc>2k$i
inoremap `wh <esc>0wiwhile (<esc>A)<Enter>{<Enter>}<Esc>kA<Enter>
inoremap `sw <esc>0wiswitch (<esc>A)<Enter>{<Enter>default:<Enter>break;<Enter>}<Esc>2kO

inoremap `g _<c-r>=expand("%:t:r")<cr><esc>VgUV:s/[^A-Z]/_/g<cr>A_H<esc>yypki#ifndef <esc>j0i#define <esc>o<cr><cr><cr>#endif<esc>2ki

inoremap `/ <esc>0a/* <esc>A */<esc>
