if has_key(g:plugs, 'vim-bookmarks')
    highlight BookmarkSign ctermbg=NONE ctermfg=160
    highlight BookmarkLine ctermbg=194 ctermfg=NONE
    let g:bookmark_sign = '♥'
    let g:bookmark_highlight_lines = 1
    nmap <Leader>m <Plug>BookmarkToggle
    nmap <Leader>mi <Plug>BookmarkAnnotate
    nmap <Leader>ma <Plug>BookmarkShowAll
    nmap <Leader>mj <Plug>BookmarkNext
    nmap <Leader>mk <Plug>BookmarkPrev
    nmap <Leader>mc <Plug>BookmarkClear
    nmap <Leader>mx <Plug>BookmarkClearAll
endif
