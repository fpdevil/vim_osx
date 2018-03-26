"{{{ vim motions on speed
if has_key(g:plugs, 'vim-easymotion')
    "map <Leader><Leader> <Plug>(easymotion-prefix)

    let g:EasyMotion_do_mapping        = 1
    let g:EasyMotion_do_shade          = 1
    let g:EasyMotion_inc_highlight     = 1
    let g:EasyMotion_landing_highlight = 1
    let g:EasyMotion_smartcase         = 1
    let g:EasyMotion_use_smartsign_us  = 1

    "let g:EasyMotion_startofline       = 0
    "let g:EasyMotion_off_screen_search = 0
    "let g:EasyMotion_use_upper         = 0
    "let g:EasyMotion_skipfoldedline    = 0

    " keep cursor colum when JK motion
    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><Leader>w <Plug>(easymotion-w)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
    map <Leader><leader>. <Plug>(easymotion-repeat)
endif
"}}}
