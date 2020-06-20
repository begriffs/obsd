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

setlocal path=.,,*/include/**2,./*/include/**2
setlocal path+=/usr/include/**4,/usr/local/include/**3

setlocal tags=./tags,**5/tags,tags;~
"                                ^ in working dir, or parents
"                         ^ in any subfolder of working dir
"                 ^ sibling of open file

" the default is menu,preview but the preview window is annoying
setlocal completeopt=menu

iabbrev #i #include
iabbrev #d #define
iabbrev main() int main(int argc, char **argv)

" add #include guard
iabbrev #g <C-R>=toupper(substitute(expand("%:p:h:t") . "_" . expand("%:t:r") . "_H", "[^a-z]", "_", "ig"))<CR><esc>yypki#ifndef <esc>j0i#define <esc>o<cr><cr>#endif<esc>2ki

" run cdecl on line
nmap <buffer><silent> <LocalLeader>d :echo system('cdecl -x C99', 'explain ' . substitute(getline('.'), '=.*', '', ''))<CR>

" Adapted from Jason Duell's cscope settings
if has("cscope")
	" place results into quickfix, and clear it each time
	setlocal cscopequickfix=s-,c-,d-,i-,t-,e-,a-

	" show parent directory name in file path
	setlocal cscopepathcomp=2

	" steal the CTRL-] key
	setlocal cst

	" attempt to connect quietly
	setlocal nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	setlocal csverb

	" 's'   symbol: find all references to the token under cursor
	" 'g'   global: find global definition(s) of the token under cursor
	" 'c'   calls:  find all calls to the function name under cursor
	" 't'   text:   find all instances of the text under cursor
	" 'e'   egrep:  egrep search for the word under cursor
	" 'f'   file:   open the filename under cursor
	" 'i'   includes: find files that include the filename under cursor
	" 'd'   called: find functions that function under cursor calls
	nmap <buffer><C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <buffer><C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <buffer><C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim)
	" split vertically, with search result displayed in
	" the new window.
	nmap <buffer><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <buffer><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <buffer><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

	" Hitting CTRL-space *twice* does a horizontal
	" split instead of a vertical one
	nmap <buffer><C-@><C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-@><C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-@><C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-@><C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-@><C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <buffer><C-@><C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <buffer><C-@><C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <buffer><C-@><C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>
endif
