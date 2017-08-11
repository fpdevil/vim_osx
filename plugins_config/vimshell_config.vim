" ------------------------------------------------------------------------------------
" --- vimshell customizations
" ------------------------------------------------------------------------------------
"{{{ vimshell prompt setup
if has_key(g:plugs, 'vimshell.vim')
    let g:vimshell_user_prompt    = 'fnamemodify(getcwd(), ":~")'
    let g:vimshell_prompt         = '$ '
    let g:vimshell_prompt_expr    = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
    let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
endif
"}}}
