" This file can contain generic settings common/un-common to plugins

" ------------------------------------------------------------------------------------
" ------ fix AutoPair inserting <CR> after pressing enter                       ------
" ------------------------------------------------------------------------------------
let g:AutoPairsMapCR              = 0
let g:AutoPairsShortcutToggle     = 'π' " <m-p>
let g:AutoPairsShortcutFastWrap   = '∑  ' " <m-w>
let g:AutoPairsShortcutJump       = '∆' " <m-j>
let g:AutoPairsShortcutBackInsert = '∫' " <m-b>


" ------------------------------------------------------------------------------------
"  key mapping/unmapping section
" ------------------------------------------------------------------------------------
" {{{k.vim
" unmap key(s) for k.vim (for any curl commands in .sh file place cursor and <CR>)
" the other features are not used any more for now so offloading them
" unmap <leader>t which is bound by k.vim as I don't need it
execute 'silent! au VimEnter * unmap <leader>t'
" unmap <leader>L bound to KLoadTemp() from k.vim as I don't need it
execute 'silent! au VimEnter * unmap <leader>L'
" unmap <leader>r bound to RunInteractive()
execute 'silent! au VimEnter * unmap <leader>r'

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
if has("ballooneval")         " available only for gvim
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
            \ ['▷ 100 Continue',
            \ 'echo ''The initial part of a request has been received and has not yet been rejected by the server. The server intends to send a final response after the request has been fully received and acted upon.'''],
            \ ['▷ 101 Switching Protocols',
            \ 'echo ''The server understands and is willing to comply with client request, via Upgrade header field, for a change in the application protocol being used on this connection'''],
            \ ['▷ 102 Processing',
            \ 'echo ''An interim response used to inform client that the server has accepted the complete request, but has not yet completed it'''],
            \ ['▷ 200 OK',
            \ 'echo ''The request has succeeded'''],
            \ ['▷ 201 Created',
            \ 'echo ''The request has been fulfilled and has resulted in one or more new resources being created'''],
            \ ['▷ 202 Accepted',
            \ 'echo ''The request has been accepted for processing, but the processing has not been completed. The request might or might not eventually be acted upon, as it might be disallowed when processing actually takes place'''],
            \ ['▷ 203 Non-Authoritative Information',
            \ 'echo ''The request was successful but the enclosed payload has been modified from that of the origin server(s) 200 OK response by a transforming proxy'''],
            \ ['▷ 204 No Content',
            \ 'echo ''The server has successfully fulfilled the request and that there is no additional content to send in the response payload body'''],
            \ ['▷ 205 Reset Content',
            \ 'echo ''The server has fulfilled the request and desires that the user agent reset the document view, which caused the request to be sent, to its original state as received from the origin server'''],
            \ ['▷ 206 Partial Content',
            \ 'echo ''The server is successfully fulfilling a range request for target resource by transferring one or more parts of the selected representation that correspond to satisfiable ranges found in the request(s) Range header field'''],
            \ ['▷ 207 Multi-Status',
            \ 'echo ''A Multi-Status response conveys information about multiple resources in situations where multiple status codes might be appropriate'''],
            \ ['▷ 208 Already Reported',
            \ 'echo ''Used inside a DAV: propstat response element to avoid enumerating the internal members of multiple bindings to the same collection repeatedly'''],
            \ ['▷ 226 IM Used',
            \ 'echo ''The server has fulfilled a GET request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance'''],
            \ ['▷ 300 Multiple Choices',
            \ 'echo ''The target resource has more than one representation, each with its own more specific identifier, and information about the alternatives is being provided so that the user (or user agent) can select a preferred representation by redirecting its request to one or more of those identifiers'''],
            \ ['▷ 301 Moved Permanently',
            \ 'echo ''The target resource has been assigned a new permanent URI and any future references to this resource ought to use one of the enclosed URI(s)'''],
            \ ['▷ 302 Found',
            \ 'echo ''The target resource resides temporarily under a different URI. Since the redirection might be altered on occasion, the client ought to continue to use the effective request URI for future requests'''],
            \ ['▷ 303 See Other',
            \ 'echo ''The server is redirecting the user agent to a different resource, as indicated by a URI in the Location header field, which is intended to provide an indirect response to the original request'''],
            \ ['▷ 304 Not Modified',
            \ 'echo ''A conditional GET or HEAD request has been received and would have resulted in a 200 OK response if it were not for the fact that the condition evaluated to false'''],
            \ ['▷ 305 Use Proxy',
            \ 'echo ''Defined in a previous version of this specification and is now deprecated, due to security concerns regarding in-band configuration of a proxy'''],
            \ ['▷ 307 Temporary Redirect',
            \ 'echo ''The target resource resides temporarily under a different URI and the user agent MUST NOT change the request method if it performs an automatic redirection to that URI'''],
            \ ['▷ 308 Permanent Redirect',
            \ 'echo ''The target resource has been assigned a new permanent URI and any future references to this resource ought to use one of the enclosed URI(s)'''],
            \ ]

" @end Unite http codes menu}}}
