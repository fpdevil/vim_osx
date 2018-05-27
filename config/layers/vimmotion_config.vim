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

    " with leader map
    if has_key(g:lmap, 'm')
        let g:lmap.m.u.j = {
                    \ 'name' : 'Jump/Join/Split',
                    \ 'j' : ['<Plug>(easymotion-prefix)s', 'Jump to a character'],
                    \ 'J' : ['<Plug>(easymotion-s2)', 'Jump to a suite of 2 characters'],
                    \ 'l' : ['<Plug>(easymotion-bd-k)', 'Jump to a line'],
                    \ 'w' : ['<Plug>(easymotion-bd-w)', 'Jump to a word'],
                    \ 'f' : ['<Plug>(easymotion-bd-f)', 'Jump to a character'],
                    \ '.' : ['<Plug>(easymotion-repeat)', 'Repeat'],
                    \ }
    endif
endif
"}}}
