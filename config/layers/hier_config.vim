" ------------------------------------------------------------------------------------
" -------           settings for vim hier to highlight errors                  -------
" ------------------------------------------------------------------------------------
if has_key(g:plugs, 'vim-hier')
    execute "highlight qf_error_ucurl gui=undercurl guisp=Red"
    let g:hier_highlight_group_qf  = "qf_error_ucurl"
    execute "highlight qf_warning_ucurl gui=undercurl guisp=Blue"
    let g:hier_highlight_group_qfw = "qf_warning_ucurl"
endif
