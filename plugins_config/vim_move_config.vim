" ------------------------------------------------------------------------------------
" ---- vim-move move lines and selections up or down                              ----
" ------------------------------------------------------------------------------------
if has_key(g:plugs, 'vim-move')
    let g:move_map_keys = 0
    vmap <C-j> <Plug>MoveBlockDown
    vmap <C-k> <Plug>MoveBlockUp
    nmap <A-j> <Plug>MoveLineDown
    nmap <A-k> <Plug>MoveLineUp
endif
