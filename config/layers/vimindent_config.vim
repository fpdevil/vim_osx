"{{{  settings for vim-indent-guides
"     ctermbg 234 = darkgrey, ctermbg 235 = lightgrey
if has_key(g:plugs, 'vim-indent-guides')
    let g:indent_guides_auto_colors           = 0
    let g:indent_guides_enable_on_vim_startup = 0
    let g:indent_guides_color_change_percent  = 7
    let g:indent_guides_start_level           = 2
    let g:indent_guides_guide_size            = 1
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=darkgrey ctermbg=252
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=251
    nnoremap <Leader>ti :IndentGuidesToggle<CR>
endif
"}}}
