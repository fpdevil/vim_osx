" -------------------------------------------------------------------
"  Complete parameter after select the completion. Integration with
"  YouCompleteMe(ycm), deoplete, neocomplete.
" -------------------------------------------------------------------
"{{{ if CompleteParameter.vim is present
if has_key(g:plugs, 'CompleteParameter.vim')
    "set cmdheight=2
    set noshowmode
    let g:complete_parameter_log_level             = 1
    let g:complete_parameter_use_ultisnips_mapping = 1
    let g:complete_parameter_echo_signature        = 1
    " auto-pairs conflict handling
    if has_key(g:plugs,'auto-pairs')
        let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
        inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
    endif
    inoremap <silent><expr> ( complete_parameter#pre_complete("()")
    smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
endif
"}}}
