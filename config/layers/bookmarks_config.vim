if has_key(g:plugs, 'vim-bookmarks')
    highlight BookmarkSign ctermbg=NONE ctermfg=160
    highlight BookmarkLine ctermbg=194 ctermfg=NONE
    let g:bookmark_sign = '♥'
    let g:bookmark_highlight_lines = 1
    nmap <Leader>bt <Plug>BookmarkToggle
    nmap <Leader>ba <Plug>BookmarkAnnotate
    nmap <Leader>bs <Plug>BookmarkShowAll
    nmap <Leader>bn <Plug>BookmarkNext
    nmap <Leader>bp <Plug>BookmarkPrev
    nmap <Leader>bc <Plug>BookmarkClear
    nmap <Leader>bx <Plug>BookmarkClearAll
    "nmap <Leader>mt <Plug>BookmarkToggle
    "nmap <Leader>mi <Plug>BookmarkAnnotate
    "nmap <Leader>ma <Plug>BookmarkShowAll
    "nmap <Leader>mj <Plug>BookmarkNext
    "nmap <Leader>mk <Plug>BookmarkPrev
    "nmap <Leader>mc <Plug>BookmarkClear
    "nmap <Leader>mx <Plug>BookmarkClearAll
endif
