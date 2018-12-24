"{{{ vim motions on speed
if has_key(g:plugs, 'vim-easymotion')

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

    "map <Leader><Leader> <Plug>(easymotion-prefix)
    " keep cursor colum when JK motion
    "map <Leader><leader>h <Plug>(easymotion-linebackward)
    "map <Leader><Leader>j <Plug>(easymotion-j)
    "map <Leader><Leader>k <Plug>(easymotion-k)
    "map <Leader><Leader>w <Plug>(easymotion-w)
    "map <Leader><leader>l <Plug>(easymotion-lineforward)
    "map <Leader><leader>. <Plug>(easymotion-repeat)
    "nmap <Leader>jf <Plug>(easymotion-overwin-f)

    " with leader map
    let g:lmap = get(g:, 'lmap', {})
    let g:lmap.j = {
                \ 'name': '+Jump/Join/Split ',
                \ '.' : ['call feedkeys("\<Plug>(easymotion-repeat)")', 'EasyMotion Repeat'],
                \ ',' : ['call feedkeys("\<Plug>(easymotion-prefix)")', 'EasyMotion Prefix'],
                \ 's' : ['call feedkeys("\<Plug>(easymotion-overwin-s2)")', 'EasyMotion 2 char search'],
                \ 'w' : ['call feedkeys("\<Plug>(easymotion-overwin-w)")', 'EasyMotion jump to a word'],
                \ 'l' : ['call feedkeys("\<Plug>(easymotion-overwin-l)")', 'EasyMotion jump to a line'],
                \ 'f' : ['call feedkeys("\<Plug>(easymotion-overwin-f)")', 'EasyMotion jump to a char'],
                \ }
endif
"}}}
