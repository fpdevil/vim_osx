"{{{ settings for displaying the indention levels
if has_key(g:plugs, 'indentLine')
    autocmd! User indentLine doautocmd indentLine Syntax
    let g:indentLine_char            = '¦'
    let g:indentLine_enabled         = 1
    let g:indentLine_conceallevel    = 2
    let g:indentLine_color_term      = 239
    let g:indentLine_color_gui       = '#4A9586'
    let g:indentLine_concealcursor   = 'niv'      " default 'inc'
    let g:indentLine_fileTypeExclude = ['help', 'startify', 'vimfiler']
endif
"}}}
