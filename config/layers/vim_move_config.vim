" ------------------------------------------------------------------------------------
" ---- vim-move move lines and selections up or down                              ----
" ---- In Normal mode with cursor over a line, press                              ----
" ---- Alt-Shift-j to Move Up and Ctrl-Shift-k to Move Down                       ----
" ------------------------------------------------------------------------------------
if has_key(g:plugs, 'vim-move')
    let g:move_key_modifier = 'M'
    let g:move_map_keys = 0
    vmap <C-j> <Plug>MoveBlockDown
    vmap <C-k> <Plug>MoveBlockUp
    nmap Ô <Plug>MoveLineUp
    nmap  <Plug>MoveLineDown
endif

" Notes
" To check what Alt+Shijt+j or Alt+Shift+k is printing
" type the combination in Insert mode in vim
