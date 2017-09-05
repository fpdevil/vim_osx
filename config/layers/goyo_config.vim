" ----------------------------------------------------------------------------
" goyo.vim + limelight.vim
" ----------------------------------------------------------------------------

if has_key(g:plugs, 'limelight.vim')
    let g:limelight_paragraph_span = 1
    let g:limelight_priority       = -1

    " Color name (:help cterm-colors) or ANSI code
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_ctermfg = 240

    " Color name (:help gui-colors) or RGB color
    let g:limelight_conceal_guifg = 'DarkGray'
    let g:limelight_conceal_guifg = '#777777'

    " Default: 0.5
    let g:limelight_default_coefficient = 0.7

    " Number of preceding/following paragraphs to include (default: 0)
    let g:limelight_paragraph_span = 1

    " Beginning/end of paragraph
    "   When there's no empty line between the paragraphs
    "   and each paragraph starts with indentation
    let g:limelight_bop = '^\s'
    let g:limelight_eop = '\ze\n^\s'

    " Highlighting priority (default: 10)
    "   Set it to -1 not to overrule hlsearch
    let g:limelight_priority = -1
endif

let s:save_option = {}

function! s:goyo_enter()
    let s:save_option['showmode']  = &showmode
    let s:save_option['showcmd']   = &showcmd
    let s:save_option['scrolloff'] = &scrolloff
    set noshowmode
    set noshowcmd
    set scrolloff=999

    if has_key(g:plugs, 'limelight.vim')
        Limelight
        let s:save_option['limelight'] = 1
    endif

    let &l:statusline = '%M'
    hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
    let &showmode  = s:save_option['showmode']
    let &showcmd   = s:save_option['showcmd']
    let &scrolloff = s:save_option['scrolloff']

    if get(s:save_option, 'limelight', 0)
        execute 'Limelight!'
    endif
endfunction

augroup goyo_map
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

nnoremap <Leader>G :Goyo<CR>
