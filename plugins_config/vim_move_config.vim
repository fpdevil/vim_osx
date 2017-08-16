" ------------------------------------------------------------------------------------
" ---- vim-move move lines and selections up or down                              ----
" ---- In Normal mode with cursor over a line, press                              ----
" ---- Ctrl-Shift-j to Move Up and Ctrl-Shift-k to Move Down                      ----
" ------------------------------------------------------------------------------------
if has_key(g:plugs, 'vim-move')
    let g:move_map_keys = 0
    let g:move_key_modifier = 'M'
    vmap <C-j> <Plug>MoveBlockDown
    vmap <C-k> <Plug>MoveBlockUp
    nmap <C-S-j> <Plug>MoveLineDown
    nmap <C-S-k> <Plug>MoveLineUp
endif
