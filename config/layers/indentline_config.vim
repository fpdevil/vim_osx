"{{{ settings for displaying the indention levels
"if has_key(g:plugs, 'indentLine')
if !empty(glob('~/.vim/plugged/indentLine'))
    autocmd! User indentLine doautocmd indentLine Syntax
    "let g:indentLine_color_term    = 239
    "let g:indentLine_color_gui     = '#09AA08'
    if &background                  ==# 'dark'
        let g:indentLine_color_term = get(g:, 'indentLine_color_term', 239)
        let g:indentLine_color_gui  = get(g:, 'indentLine_color_gui', '#504945')
    else
        let g:indentLine_color_gui = get(g:, 'indentLine_color_gui', '#d5c4a1')
    endif
    let g:indentLine_char            = '┆'
    let g:indentLine_concealcursor   = 'niv'      " default 'inc'
    "let g:indentLine_concealcursor  = 'inc'      " default 'inc'
    let g:indentLine_conceallevel    = 1
    let g:indentLine_fileTypeExclude = ['help', 'startify', 'vimfiler', 'haskell', 'erlang']
    let g:indentLine_setColors       = 0
    "autocmd FileType *.hs :IndentLinesDisable
endif
"}}}
