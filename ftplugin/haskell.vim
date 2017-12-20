setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4
au Bufenter *.hs compiler ghc

" disable indentlines as haskell conceal is not working properly
" autocmd FileType *.hs :IndentLinesDisable
if has_key(g:plugs,'indentline')
    let g:indentLine_enabled = 0
endif
