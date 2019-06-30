" vim compiler file
" Compiler:     LLVM clang
" Maintainer:   Joe Nelson <joe@begriffs.com>
" Last Change:  2019 Jun 29

" allow user plugin to override, can remove this
" guard if installing to personal runtime directory
if exists("current_compiler")
	finish
endif
let current_compiler = "clang"

" for older vim versions
if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

" formatting variations documented at
" https://clang.llvm.org/docs/UsersManual.html#formatting-of-diagnostics

CompilerSet errorformat=
	\%f:%l%c:{%*[^}]}{%*[^}]}:\ %trror:\ %m,
	\%f:%l%c:{%*[^}]}{%*[^}]}:\ %tarning:\ %m,
	\%f:%l:%c:\ %trror:\ %m,
	\%f:%l:%c:\ %tarning:\ %m,
	\%f(%l,%c)\ :\ %trror:\ %m,
	\%f(%l,%c)\ :\ %tarning:\ %m,
	\%f\ +%l%c:\ %trror:\ %m,
	\%f\ +%l%c:\ %tarning:\ %m,
	\%f:%l:\ %trror:\ %m,
	\%f:%l:\ %tarning:\ %m,
	\%D%*\\a[%*\\d]:\ Entering\ directory\ %*[`']%f',
	\%D%*\\a:\ Entering\ directory\ %*[`']%f',
	\%X%*\\a[%*\\d]:\ Leaving\ directory\ %*[`']%f',
	\%X%*\\a:\ Leaving\ directory\ %*[`']%f',
	\%DMaking\ %*\\a\ in\ %f

" the %D and %X patterns capture the directory change messages
" from (GNU) 'make -w'. Needed for building postgres.

CompilerSet makeprg=make
