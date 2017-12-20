setlocal tabstop=2
setlocal softtabstop=4
setlocal shiftwidth=2
setlocal showtabline=2

setlocal iskeyword+=:
setlocal complete=.,w,b,u,t,i,k

setlocal commentstring=%%s

setlocal makeprg=erlc\ %

set completeopt+=preview
