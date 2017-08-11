" for closing the error window use the below
" :lclose or :SyntasticReset

"{{{ syntax checkers settings

if has_key(g:plugs, 'syntastic')
    let g:syntastic_mode_map                 = {
                \ 'mode': 'active',
                \ 'active_filetypes': ['haskell', 'python', 'cpp'],
                \ 'passive_filetypes': ['go', 'html']
                \ }
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list            = 1
    let g:syntastic_check_on_wq              = 0                        " exit syntax checking while exiting with :wq
    let g:syntastic_vimlint_options          = {
                \ 'EVL102': 1,
                \ 'EVL103': 1,
                \ 'EVL205': 1,
                \ 'EVL105': 1
                \ }
endif

"}}}

" ------------------------------------------------------------------------------------
" -------                Personal settings for Syntastic Checker               -------
" ------- By default, Syntastic uses arrow symbols to indicate line with error -------
" ------- To spice things up, you can specify any Unicode symbol as that error -------
" ------------------------------------------------------------------------------------
" getbg function
" gets the background of a highlighting group with fallback to SignColumn group
function! s:getbg(group)
    if has("gui_running")
        let l:mode       = 'gui'
        let l:validation = '\w\+\|#\x\+'
    else
        let l:mode       = 'cterm'
        let l:validation = '\w\+'
    endif

    if synIDattr(synIDtrans(hlID(a:group)), 'reverse', l:mode)
        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'fg', l:mode)
    else
        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'bg', l:mode)
    endif

    if l:bg == '-1' || l:bg !~ l:validation
        if synIDattr(synIDtrans(hlID('SignColumn')), 'reverse', l:mode)
            let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'fg', l:mode)
        else
            let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', l:mode)
        endif
    endif

    if l:bg == '-1' || l:bg !~ l:validation
        return ''
    endif

    return l:mode . 'bg=' . l:bg
endfunction

"{{{ syntastic checker to display error and warning symbols
let g:syntastic_error_symbol         = '✗'
let g:syntastic_warning_symbol       = '⚠'
let g:syntastic_style_error_symbol   = '✍'
let g:syntastic_style_warning_symbol = '✍'
let g:sytastic_stl_format            = "[ln:%F (%t)]"
hi! link SyntasticErrorLine Visual
hi! link SyntasticWarningLine Visual
au VimEnter,ColorScheme * exec 'hi! SyntasticErrorSign guifg=red ctermfg=red ' . s:getbg('SyntasticErrorLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticWarningSign guifg=yellow ctermfg=yellow ' . s:getbg('SyntasticWarningLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticError ' . s:getbg('SyntasticErrorLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticWarning ' . s:getbg('SyntasticWarningLine')
"}}}


"{{{ status line settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"}}}
