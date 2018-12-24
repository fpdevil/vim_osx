" This file can contain generic settings common/un-common to plugins

" ------------------------------------------------------------------------------------
" ------ fix AutoPair inserting <CR> after pressing enter                       ------
" ------------------------------------------------------------------------------------
let g:AutoPairsMapCR              = 0
let g:AutoPairsShortcutToggle     = 'π' " <m-p>
let g:AutoPairsShortcutFastWrap   = '∑  ' " <m-w>
let g:AutoPairsShortcutJump       = '∆' " <m-j>
let g:AutoPairsShortcutBackInsert = '∫' " <m-b>


if has_key(g:plugs,'echodoc')
    let g:echodoc#enable_at_startup = 1
    "set noshowmode
    "set cmdheight=2
endif


" ------------------------------------------------------------------------------------
"  for typing unicode latex characters in ViM
" ------------------------------------------------------------------------------------
if has_key(g:plugs, 'latex-unicoder.vim')
    let g:unicoder_cancel_normal = 1
    let g:unicoder_cancel_insert = 1
    let g:unicoder_cancel_visual = 1
    nnoremap <C-e> :call unicoder#start(0)<CR>
    inoremap <C-e> <Esc>:call unicoder#start(1)<CR>
    vnoremap <C-e> :<C-u>call unicoder#selection()<CR>
endif


" ------------------------------------------------------------------------------------
"  ** for colorv
" ------------------------------------------------------------------------------------
let s:color_cache_dir   = GetCacheDir('.')
let g:colorv_cache_file = s:color_cache_dir . '/colorv/vim_colorv_cache'
let g:colorv_cache_fav  = s:color_cache_dir . '/colorv/vim_colorv_cache_fav'


" ------------------------------------------------------------------------------------
"  key mapping/unmapping section
" ------------------------------------------------------------------------------------
" {{{k.vim
" unmap key(s) for k.vim (for any curl commands in .sh file place cursor and <CR>)
" the other features are not used any more for now so offloading them
" unmap <leader>t which is bound by k.vim as I don't need it
"if isdirectory(expand('~/.vim/plugged/k.vim'))
if has_key(g:plugs,'k.vim')
    execute 'silent! au VimEnter * unmap <leader>t'
    " unmap <leader>L bound to KLoadTemp() from k.vim as I don't need it
    execute 'silent! au VimEnter * unmap <leader>L'
    " unmap <leader>r bound to RunInteractive()
    execute 'silent! au VimEnter * unmap <leader>r'
endif
"}}}


" ------------------------------------------------------------------------------------
"  initialize the leader key map for misc section
" ------------------------------------------------------------------------------------
let g:lmap = get(g:, 'lmap', {})

" ------------------------------------------------------------------------------------
" current function name with current-func-info.vim
" ------------------------------------------------------------------------------------
if !empty(glob('~/.vim/plugged/current-func-info.vim'))
    if has_key(g:lmap,'m')
        let g:lmap.m.f.n = [':echo cfi#format("%s", "")', 'Disp Current Function']
    endif
endif

" ------------------------------------------------------------------------------------
" Vim plugin for automated bullet lists
" ------------------------------------------------------------------------------------
if !empty(glob('~/.vim/plugged/bullets.vim'))
    " disable default mappings (CR)
    let g:bullets_set_mappings = 0
    let g:bullets_enabled_file_types = [
                \ 'markdown',
                \ 'text',
                \ 'gitcommit',
                \ 'scratch'
                \ ]
endif

" ------------------------------------------------------------------------------------
"  looking up words in an online thesaurus
" ------------------------------------------------------------------------------------
if exists(':OnlineThesaurusCurrentWord')
    if has_key(g:lmap,'m')
        let g:lmap.m.u.d = ['OnlineThesaurusCurrentWord', 'Dictionary Lookup of word under cursor']
        "nnoremap <your key binding> :OnlineThesaurusCurrentWord<CR>
    endif
endif

" ------------------------------------------------------------------------------------
" -------                     balloon eval for gvim / gui                      -------
" ------------------------------------------------------------------------------------
if has('ballooneval')         " available only for gvim
    set ballooneval           " balloons  act  as small hover menus
endif

" @start Unite buffer Menu {{{
let g:unite_source_menu_menus.searching = {
    \ 'description' : '      searchs inside the current buffer
        \                     ⌘ [space]f',
    \}

let g:unite_source_menu_menus.searching.command_candidates = [
    \['▷ search line                                                ⌘ <Leader>f',
        \'Unite -auto-preview -start-insert line'],
    \['▷ search word under the cursor                               ⌘ [space]8',
        \'UniteWithCursorWord -no-split -auto-preview line'],
    \['▷ search outlines & tags (ctags)                             ⌘ <Leader>t',
        \'Unite -vertical -winwidth=40 -direction=topleft -toggle outline'],
    \['▷ search marks',
        \'Unite -auto-preview mark'],
    \['▷ search folds',
        \'Unite -vertical -winwidth=30 -auto-highlight fold'],
    \['▷ search changes',
        \'Unite change'],
    \['▷ search jumps',
        \'Unite jump'],
    \['▷ search undos',
        \'Unite undo'],
    \['▷ search tasks                                               ⌘ <Leader>;',
        \'Unite -toggle grep:%::FIXME|TODO|NOTE|XXX|COMBAK|@todo'],
    \]

let g:unite_source_menu_menus.searching.command_candidates = custom_functions#unite_menu_gen(g:unite_source_menu_menus.searching.command_candidates, [])

nnoremap <silent>[menu]f :Unite -silent menu:searching<CR>
" @end Unite Menu }}}


let g:unite_source_menu_menus.repl = {
    \ 'description' : '           Repl
    \                                                  ⌘ [space]r',
    \}


let g:unite_source_menu_menus.repl.command_candidates = [
    \ ['▷ Javascript (nodejs) repl                                  ⌘ <Leader>rj',
    \ 'VimShellInteractive node'],
    \ ['▷ Haskell ghci repl                                         ⌘ <Leader>rh',
    \ 'VimShellInteractive ghci'],
    \ ['▷ Python3 repl                                              ⌘ <Leader>rp',
    \ 'VimShellInteractive python3'],
    \ ['▷ IPython3 repl                                             ⌘ <Leader>ri',
    \ 'VimShellInteractive ipython3'],
    \ ['▷ Erlang repl                                               ⌘ <Leader>re',
    \ 'VimShellInteractive erl'],
    \ ]

let g:unite_source_menu_menus.repl.command_candidates = custom_functions#unite_menu_gen(g:unite_source_menu_menus.repl.command_candidates, [])

" @start Unite Spell Menu {{{
let g:unite_source_menu_menus.spelling = {
    \ 'description' : '       spell checking
        \                                        ⌘ [space]s',
    \}

let g:unite_source_menu_menus.spelling.command_candidates = [
    \['▷ spell checking in English                                  ⌘ <Leader>se',
        \'setlocal spell spelllang=en'],
    \['▷ turn off spell checking                                    ⌘ <Leader>so',
        \'setlocal nospell'],
    \['▷ jumps to next bad spell word and show suggestions          ⌘ <Leader>sc',
        \'normal <Leader>sc'],
    \['▷ jumps to next bad spell word                               ⌘ <Leader>sn',
        \'normal <Leader>sn'],
    \['▷ suggestions                                                ⌘ <Leader>sp',
        \'normal <Leader>sp'],
    \['▷ add word to dictionary                                     ⌘ <Leader>sa',
        \'normal <Leader>sa'],
    \]

let g:unite_source_menu_menus.spelling.command_candidates = custom_functions#unite_menu_gen(g:unite_source_menu_menus.spelling.command_candidates, [])

nnoremap <silent>[menu]s :Unite -silent menu:spelling<CR>

" @end Unite Spell Menu }}}

" @start Unite http codes menu {{{
let g:unite_source_menu_menus.http = {
            \ 'description' : '           http status codes
            \                                     ⌘ [<leader>]uhh',
            \ }

let g:unite_source_menu_menus.http.command_candidates = [
            \['▷ 100 Continue                                                   ',
            \ 'echo "Continue"'],
            \['▷ 101 Switching Protocols                                        ',
            \ 'echo "Switching Protocols"'],
            \['▷ 200 OK                                                         ',
            \ 'echo "OK"'],
            \['▷ 201 Created                                                    ',
            \ 'echo "Created"'],
            \['▷ 202 Accepted                                                   ',
            \ 'echo "Accepted"'],
            \['▷ 203 Non-Authoritative Information                              ',
            \ 'echo "Non-Authoritative Information"'],
            \['▷ 204 No Content                                                 ',
            \ 'echo "No Content"'],
            \['▷ 205 Reset Content                                              ',
            \ 'echo "Reset Content"'],
            \['▷ 206 Partial Content                                            ',
            \ 'echo "Partial Content"'],
            \['▷ 300 Multiple Choices                                           ',
            \ 'echo "Multiple Choices"'],
            \['▷ 301 Moved Permanently                                          ',
            \ 'echo "Moved Permanently"'],
            \['▷ 302 Found                                                      ',
            \ 'echo "Found"'],
            \['▷ 303 See Other                                                  ',
            \ 'echo "See Other"'],
            \['▷ 304 Not Modified                                               ',
            \ 'echo "Not Modified"'],
            \['▷ 305 Use Proxy                                                  ',
            \ 'echo "Use Proxy"'],
            \['▷ 307 Temporary Redirect                                         ',
            \ 'echo "Temporary Redirect"'],
            \['▷ 400 Bad Request                                                ',
            \ 'echo "Bad Request"'],
            \['▷ 401 Unauthorized                                               ',
            \ 'echo "Unauthorized"'],
            \['▷ 402 Payment Required                                           ',
            \ 'echo "Payment Required"'],
            \['▷ 403 Forbidden                                                  ',
            \ 'echo "Forbidden"'],
            \['▷ 404 Not Found                                                  ',
            \ 'echo "Not Found"'],
            \['▷ 405 Method Not Allowed                                         ',
            \ 'echo "Method Not Allowed"'],
            \['▷ 406 Not Acceptable                                             ',
            \ 'echo "Not Acceptable"'],
            \['▷ 407 Proxy Authentication Required                              ',
            \ 'echo "Proxy Authoritative Required"'],
            \['▷ 408 Request Timeout                                            ',
            \ 'echo "Request Timeout"'],
            \['▷ 409 Conflict                                                   ',
            \ 'echo "Conflict"'],
            \['▷ 410 Gone                                                       ',
            \ 'echo "Gone"'],
            \['▷ 411 Length Required                                            ',
            \ 'echo "Length Required"'],
            \['▷ 412 Precondition Failed                                        ',
            \ 'echo "Precondition Failed"'],
            \['▷ 413 Request Entity Too Large                                   ',
            \ 'echo "Request Entity Too Large"'],
            \['▷ 414 Request-URI Too Long                                       ',
            \ 'echo "Request-URI Too Long"'],
            \['▷ 415 Unsupported Media Type                                     ',
            \ 'echo "Unsupported Media Type"'],
            \['▷ 416 Requested Range Not Satisfiable                            ',
            \ 'echo "Requested Range Not Satisfiable"'],
            \['▷ 417 Expectation Failed                                         ',
            \ 'echo "Expectation Failed"'],
            \['▷ 422 Unprocessable Entity                                       ',
            \ 'echo "Unprocessable Entity"'],
            \['▷ 500 Internal Server Error                                      ',
            \ 'echo "Internal Server Error"'],
            \['▷ 501 Not Implemented                                            ',
            \ 'echo "Not Implemented"'],
            \['▷ 502 Bad Gateway                                                ',
            \ 'echo "Bad Gateway"'],
            \['▷ 503 Service Unavailable                                        ',
            \ 'echo "Service Unavailable"'],
            \['▷ 504 Gateway Timeout                                            ',
            \ 'echo "Gateway Timeout"'],
            \['▷ 505 HTTP Version Not Supported                                 ',
            \ 'echo "HTTP Version Not Supported"'],
            \ ]

" @end Unite http codes menu}}}
