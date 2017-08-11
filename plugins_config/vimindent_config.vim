"{{{  settings for vim-indent-guides
if has_key(g:plugs, 'vim-indent-guides')
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_color_change_percent  = 7
    let g:indent_guides_start_level           = 2
    let g:indent_guides_guide_size            = 1
    let g:indent_guides_auto_colors           = 0
    nnoremap <Leader>ti :IndentGuidesToggle<CR>
endif
"}}}
