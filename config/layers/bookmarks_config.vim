if has_key(g:plugs, 'vim-bookmarks')
    highlight BookmarkSign ctermbg=NONE ctermfg=160
    highlight BookmarkLine ctermbg=194 ctermfg=NONE
    let g:bookmark_sign = '♥'
    let g:bookmark_highlight_lines = 1

    " for bookmarks key mappings using vim-leader-map
    let g:lmap = get(g:, 'lmap', {})
    let g:lmap.b  = {
                \ 'name' : '+Bookmark Tools'    ,
                \ 't'    : ['BookmarkToggle'   , 'BookmarkToggle '],
                \ 'a'    : ['BookmarkAnnotate' , 'BookmarkAnnotate '],
                \ 's'    : ['BookmarkShowAll'  , 'BookmarkShowAll '],
                \ 'n'    : ['BookmarkNext'     , 'BookmarkNext '],
                \ 'p'    : ['BookmarkPrev'     , 'BookmarkPrev '],
                \ 'c'    : ['BookmarkClear'    , 'BookmarkClear '],
                \ 'x'    : ['BookmarkClearAll' , 'BookmarkClearAll '],
                \ }

    " unite menu interface
    let g:unite_source_menu_menus.bookmarks = {
                \ 'description' : '      bookmarks
                \                                             ⌘ [space]m',
                \ }

    let g:unite_source_menu_menus.bookmarks.command_candidates = [
                \ ['▷ open bookmarks', 'Unite bookmark:*'],
                \ ['▷ add bookmark', 'UniteBookmarkAdd'],
                \ ]

    let g:unite_source_menu_menus.bookmarks.command_candidates =
                \ custom_functions#unite_menu_gen(g:unite_source_menu_menus.bookmarks.command_candidates, [])

    nnoremap <silent>[menu]m :Unite -silent menu:bookmarks<CR>
endif
