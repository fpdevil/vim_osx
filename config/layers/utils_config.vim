" This file can contain generic settings common/un-common to plugins

" ------------------------------------------------------------------------------------
" ------ fix AutoPair inserting <CR> after pressing enter                       ------
" ------------------------------------------------------------------------------------
let g:AutoPairsMapCR = 0


" ------------------------------------------------------------------------------------
"  initialize the leader key map for misc section
" ------------------------------------------------------------------------------------
let g:lmap = get(g:, 'lmap', {})

" ------------------------------------------------------------------------------------
" current function name with current-func-info.vim
" ------------------------------------------------------------------------------------
if !empty(glob('~/.vim/plugged/current-func-info.vim'))
    let g:lmap.m.f.n = [':echo cfi#format("%s", "")', 'Disp Current Function']
endif


" ------------------------------------------------------------------------------------
"  looking up words in an online thesaurus
" ------------------------------------------------------------------------------------
if exists(':OnlineThesaurusCurrentWord')
    let g:lmap.m.u.t = ['OnlineThesaurusCurrentWord', 'Lookup word under cursor']
    nnoremap <your key binding> :OnlineThesaurusCurrentWord<CR>
endif

" ------------------------------------------------------------------------------------
" -------                     balloon eval for gvim / gui                      -------
" ------------------------------------------------------------------------------------
if has("ballooneval")         " available only for gvim
    set ballooneval           " balloons  act  as small hover menus
endif

" Unite Menu {{{
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

" END Unite Menu }}}

" Unite Spell Menu {{{
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

" END Unite Spell Menu }}}
