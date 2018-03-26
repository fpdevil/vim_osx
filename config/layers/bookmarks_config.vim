if has_key(g:plugs, 'vim-bookmarks')
    highlight BookmarkSign ctermbg=NONE ctermfg=160
    highlight BookmarkLine ctermbg=194 ctermfg=NONE
    let g:bookmark_sign = '♥'
    let g:bookmark_highlight_lines = 1

    "nmap <Leader>bt <Plug>BookmarkToggle
    "nmap <Leader>ba <Plug>BookmarkAnnotate
    "nmap <Leader>bs <Plug>BookmarkShowAll
    "nmap <Leader>bn <Plug>BookmarkNext
    "nmap <Leader>bp <Plug>BookmarkPrev
    "nmap <Leader>bc <Plug>BookmarkClear
    "nmap <Leader>bx <Plug>BookmarkClearAll
    " for bookmarks key mappings using vim-leader-map
    let g:lmap = get(g:, 'lmap', {})
    let g:lmap.b  = {
                \ 'name' : 'Bookmark Tools',
                \ 't'    : ['<Plug>BookmarkToggle', 'BookmarkToggle'],
                \ 'a'    : ['<Plug>BookmarkAnnotate', 'BookmarkAnnotate'],
                \ 's'    : ['<Plug>BookmarkShowAll', 'BookmarkShowAll'],
                \ 'n'    : ['<Plug>BookmarkNext', 'BookmarkNext'],
                \ 'p'    : ['<Plug>BookmarkPrev', 'BookmarkPrev'],
                \ 'c'    : ['<Plug>BookmarkClear', 'BookmarkClear'],
                \ 'x'    : ['<Plug>BookmarkClearAll', 'BookmarkClearAll'],
                \ }
endif
