set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set showtabline=2
"set concealcursor=nciv
set concealcursor=""           " disable conealing for active line

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
