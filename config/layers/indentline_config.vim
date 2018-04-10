"{{{ settings for displaying the indention levels
"if has_key(g:plugs, 'indentLine')
if !empty(glob('~/.vim/plugged/indentLine'))
    autocmd! User indentLine doautocmd indentLine Syntax
    let g:indentLine_color_term      = 239
    let g:indentLine_color_gui       = '#09AA08'
    let g:indentLine_char            = '┆'
    "let g:indentLine_concealcursor   = 'niv'      " default 'inc'
    let g:indentLine_concealcursor   = 'inc'      " default 'inc'
    let g:indentLine_conceallevel    = 2
    let g:indentLine_fileTypeExclude = ['help', 'startify', 'vimfiler', 'haskell']
    let g:indentLine_setColors = 0
    "autocmd FileType *.hs :IndentLinesDisable
endif
"}}}
