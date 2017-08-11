" {{{ for multiple cursors
"     avoid ycm auto-complete suggestions in MultipleCursor mode also prevent
"     neocomplete trigger function calls until we are finished with multiple
"     cursors editing by locking and unlocking

if has_key(g:plugs, 'vim-multiple-cursors')
    function! Multiple_cursors_before()
        call youcompleteme#DisableCursorMovedAutocommands()
        if exists(':NeoCompleteLock') == 2
            exe 'NeoCompleteLock'
        endif
    endfunction

    function! Multiple_cursors_after()
        call youcompleteme#EnableCursorMovedAutocommands()
        if exists('NeoCompleteLockUnlock') == 2
            exe 'NeoCompleteLockUnlock'
        endif
    endfunction

    " default highlighting (see help :highlight and help :highlight-link)
    highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
    highlight link multiple_cursors_visual Visual
    " key bindings for multiple cursors
    let g:multi_cursor_next_key = '<C-j>'
    let g:multi_cursor_prev_key = '<C-k>'
    let g:multi_cursor_skip_key = '<C-x>'
    let g:multi_cursor_quit_key = '<Esc>'
endif
" }}}
