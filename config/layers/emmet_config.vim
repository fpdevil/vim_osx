" ------------------------------------------------------------------------------------
" ---- vim html completions using emmet mode                                      ----
" ------------------------------------------------------------------------------------
if has_key(g:plugs, 'emmet-vim')
    let g:user_emmet_install_global         = 0
    let g:user_emmet_leader_key             = 'C-Z'
    autocmd FileType html,css, EmmetInstall
endif
