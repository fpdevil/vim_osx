" ------------------------------------------------------------------------------------
" ---- vim html completions using emmet mode                                      ----
" ------------------------------------------------------------------------------------
if has_key(g:plugs, 'emmet-vim')
    let g:user_emmet_install_global         = 0
    let g:user_emmet_leader_key             = 'C-Z'
    " so emmet.vim will work in JSX
    let g:user_emmet_settings = {
    \  'javascript.jsx' : {
    \      'extends': 'jsx',
    \      'quote_char': '"',
    \  },
    \}
    autocmd FileType html,css, EmmetInstall
endif
