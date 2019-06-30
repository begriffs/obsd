" the smartest indent engine for C
setlocal cindent
" customize indentation for BSD style
setlocal cino="Ls,:0,l1,t0,(s,U1,W4"

" show trailing whitespace
" let c_space_errors=1

" for quickfix errorformat
compiler clang
" shows long build messages better
setlocal ch=2

" auto-create folds per grammar
setlocal foldmethod=syntax
setlocal foldlevel=10

setlocal path=.,,*/include,./*/include
setlocal path+=/usr/include/**4,/usr/local/include/**3

setlocal tags=./tags,**5/tags,tags;~
"                                ^ in working dir, or parents
"                         ^ in any subfolder of working dir
"                 ^ sibling of open file

" the default is menu,preview but the preview window is annoying
setlocal completeopt=menu

iabbrev #i #include
iabbrev #d #define
iabbrev main() int main(int argc, const char **argv)

" add #include guard
iabbrev #g _<c-r>=expand("%:t:r")<cr><esc>VgUV:s/[^A-Z]/_/g<cr>A_H<esc>yypki#ifndef <esc>j0i#define <esc>o<cr><cr>#endif<esc>2ki

