" ------------------------------------------------------------------------------------
" --------                      TagBar customization                         ---------
" ------------------------------------------------------------------------------------
let g:tagbar_usearrows = 1
if has_key(g:lmap,'m')
    "nnoremap <leader>mut :TagbarToggle<CR>
    let g:lmap.m.u.t = ['TagbarToggle', 'Toggle Tagbar']
endif
