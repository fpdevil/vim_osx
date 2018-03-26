" This file can contain generic settings common/un-common to plugins

" ------------------------------------------------------------------------------------
" ------ fix AutoPair inserting <CR> after pressing enter                       ------
" ------------------------------------------------------------------------------------
let g:AutoPairsMapCR = 0

" ------------------------------------------------------------------------------------
" current function name with current-func-info.vim
" ------------------------------------------------------------------------------------
if !empty(glob('~/.vim/plugged/current-func-info.vim'))
    let g:lmap = get(g:, 'lmap', {})
    let g:lmap.m.f.n = [':echo cfi#format("%s", "")', 'Disp Current Function']
endif

" ------------------------------------------------------------------------------------
" -------                     balloon eval for gvim / gui                      -------
" ------------------------------------------------------------------------------------
if has("ballooneval")         " available only for gvim
    set ballooneval           " balloons  act  as small hover menus
endif
