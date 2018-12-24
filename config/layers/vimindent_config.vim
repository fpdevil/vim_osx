"{{{  settings for vim-indent-guides
"     ctermbg 234 = darkgrey, ctermbg 235 = lightgrey
"if has_key(g:plugs, 'vim-indent-guides')
if !empty(glob('~/.vim/plugged/vim-indent-guides'))
    let g:indent_guides_default_mapping       = 0
    let g:indent_guides_auto_colors           = 0
    let g:indent_guides_enable_on_vim_startup = 0
    let g:indent_guides_color_change_percent  = 7
    let g:indent_guides_start_level           = 2
    let g:indent_guides_guide_size            = 1
    let g:indent_guides_exclude_filetypes     = ['help', 'diff']
    let g:indent_guides_tab_guides            = 0
    let g:indent_guides_soft_pattern          = ' '

    augroup indent_color_grp
        autocmd!
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
    augroup END

    "nnoremap <Leader>ti :IndentGuidesToggle<CR>
    if has_key(g:lmap,'w')
        let g:lmap.w.i = {
                    \ 'name' : 'Indent levels displaying',
                    \ 't'    : ['IndentGuidesToggle', 'Toggle indent guides'],
                    \ 'e'    : ['IndentGuidesEnable', 'Enbale indent guides'],
                    \ 'd'    : ['IndentGuidesDisable', 'Disable indent guides'],
                    \ }
    endif
endif
"}}}
