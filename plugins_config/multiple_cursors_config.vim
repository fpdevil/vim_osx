" {{{ for multiple cursors
"     avoid ycm auto-complete suggestions in MultipleCursor mode also prevent
"     neocomplete trigger function calls until we are finished with multiple
"     cursors editing by locking and unlocking

if has_key(g:plugs, 'vim-multiple-cursors')
    function! Multiple_cursors_before()
        if exists("*youcompleteme#EnableCursorMovedAutocommands")
            call youcompleteme#DisableCursorMovedAutocommands()
        endif
        if exists(':NeoCompleteLock') == 2
            exe 'NeoCompleteLock'
        endif
    endfunction

    function! Multiple_cursors_after()
        if exists("*youcompleteme#EnableCursorMovedAutocomm")
            call youcompleteme#EnableCursorMovedAutocommands()
        endif
        if exists('NeoCompleteLockUnlock') == 2
            exe 'NeoCompleteLockUnlock'
        endif
    endfunction

    " default highlighting (see help :highlight and help :highlight-link)
    highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
    highlight link multiple_cursors_visual Visual
    " key bindings for multiple cursors
    let g:multi_cursor_next_key = '<C-z>'
    let g:multi_cursor_prev_key = '<C-m>'
    let g:multi_cursor_skip_key = '<C-x>'
    let g:multi_cursor_quit_key = '<Esc>'
endif
" }}}
