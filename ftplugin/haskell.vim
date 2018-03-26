setlocal showtabline=2
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4
"setlocal concealcursor=nciv
setlocal concealcursor=""           " disable conealing for active line

au Bufenter *.hs compiler ghc
au Bufread,BufNewFile *.hsc set filetype=haskell

" disable indentlines as haskell conceal is not working properly
" autocmd FileType *.hs :IndentLinesDisable
if has_key(g:plugs,'indentline')
    let g:indentLine_enabled = 0
endif

" displaying check/lint status in statusline
"let &l:statusline = '%{empty(getqflist()) ? "[No Errors]" : "[Errors Found]"}' 
"            \ . 
"            \ (empty(&l:statusline) ? &statusline : &l:statusline)
