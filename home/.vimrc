syntax on

set noexpandtab
set tabstop=4
set shiftwidth=4

set cindent
set cinoptions="(0,t0"

set backspace=eol,indent,start
set noswapfile

inoremap `in <esc>0i#include <<esc>A><Enter>
inoremap `m int main(int argc, char** argv)<Enter>{<Enter>return 0;<Enter>}<Esc>2kA<Enter>

inoremap `if <esc>0wiif (<esc>A)<Enter>{<Enter>}<Esc>kA<Enter>
inoremap `ie <esc>0wiif (<esc>A)<Enter>{<Enter>}<Enter>else<Enter>{<Enter>}<Esc>4kA<Enter>
inoremap `fo for (<esc>A)<Enter>{<Enter>}<Esc>2k$i
inoremap `wh <esc>0wiwhile (<esc>A)<Enter>{<Enter>}<Esc>kA<Enter>
inoremap `sw <esc>0wiswitch (<esc>A)<Enter>{<Enter>default:<Enter>break;<Enter>}<Esc>2kO

inoremap `g __<c-r>=expand("%:t:r")<cr><esc>VgUV:s/[^A-Z]/_/g<cr>yypki#ifndef <esc>j0i#define <esc>o<cr><cr><cr>#endif<esc>2ki
