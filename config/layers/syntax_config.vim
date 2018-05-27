" for closing the error window use the below
" :lclose or :SyntasticReset

" ------------------------------------------------------------------------------------
" -----                      syntax checkers settings                            -----
" ------------------------------------------------------------------------------------
"if has_key(g:plugs, 'syntastic')
if !empty(glob('~/.vim/plugged/syntastic'))
    " to disable syntastic if really needed (:stm - :ab lists all abbreviations)
    cabbrev stm SyntasticToggleMode<CR>
    let g:syntastic_mode_map                 = {
                \ 'mode'                : 'active',
                \ 'active_filetypes'    : ["haskell", "python", "cpp", "c", "javascript"],
                \ 'passive_filetypes'   : ["go", "html", "erlang"]
                \ }
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list            = 1
    let g:syntastic_check_on_wq              = 1                " exit syntax checking while exiting with :wq
    "let g:syntastic_aggregate_errors        = 1                " runs all checkers on current filetype
    let g:syntastic_vimlint_options          = {
                \ 'EVL102': 1,
                \ 'EVL103': 1,
                \ 'EVL205': 1,
                \ 'EVL105': 1
                \ }

    " disable synastic checker for erlang as the erlang's plugin
    " vim-erlang-compiler is conflicting with this
    let g:syntastic_ignore_files = ['\.erl$']

    " ------------------------------------------------------------------------------------
    " syntax checkers if any based on the language
    " ------------------------------------------------------------------------------------
    " Set syntax checker for javascript {{{
    function! SetSyntasticJsLinter()
        let l:available_linters = ListJsLinterConfig()
        " now look through the linter config in current dir
        let l:jslinter = CheckJsLintConfig(expand('%:p', l:available_linters)
        if l:jslinter[0] == ''
            let l:jslinter = CheckJsLintConfig($HOME, l:available_linters)
        endif

        " now configure the linter
        if l:jslinter[0] != ''
            let g:syntastic_javascript_checkers = [l:jslinter[0]]
            if l:jslinter[0] != l:jslinter[1]
                exec 'let g:syntastic_javascript_' . l:jslinter[0] . '_exec = "' . l:jslinter[1] . '"'
            endif
            let g:syntastic_javascript_checkers = [l:jslinter[0]]
        endif
    endfunction
    " }}}

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
    let g:syntastic_enable_highlighting  = 1
    let g:syntastic_enable_signs         = 1
    let g:syntastic_error_symbol         = '❌'
    let g:syntastic_style_error_symbol   = '⁉️'
    let g:syntastic_warning_symbol       = '⚠️'
    let g:syntastic_style_warning_symbol = '💩'
    let g:sytastic_stl_format            = "[ln:%F (%t)]"
    
    "let g:syntastic_error_symbol = '✖'
    "let g:syntastic_warning_symbol = '➤'
    "let g:syntastic_info_symbol = '🛈'


    "highlight SyntasticErrorSign ctermfg=red ctermbg=237
    "highlight SyntasticWarningSign ctermfg=yellow ctermbg=237
    "highlight SyntasticStyleErrorSign ctermfg=red ctermbg=237
    "highlight SyntasticStyleWarningSign ctermfg=yellow ctermbg=237

    hi! link SyntasticErrorLine Visual
    hi! link SyntasticWarningLine Visual
    hi! link SyntasticErrorSign SignColumn
    hi! link SyntasticWarningSign SignColumn
    hi! link SyntasticStyleErrorSign SignColumn
    hi! link SyntasticStyleWarningSign SignColumn
    
    "}}}


    "{{{ status line settings for syntastic
    "set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    "set statusline+=%*
    set statusline+=\ %#warningmsg#
    set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
    set statusline+=%*
    "}}}

    "{{{ disable syntastic on a per buffer basis (some work files blow it up)
    function! SyntasticDisableBuffer()
        let b:syntastic_skip_checks = 1
        SyntasticReset
        echo 'Syntastic disabled for this buffer'
    endfunction
    
    command! SyntasticDisableBuffer call SyntasticDisableBuffer()
    
    " Toggle syntastic checking at will
    "nnoremap <leader>sy :SyntasticCheck<CR> :SyntasticToggleMode<CR>
    if has_key(g:lmap,'l')
        let g:lmap.l.x = {
                    \ 'name': 'Syntax Checker',
                    \ 'c': ['SyntasticCheck', 'Check Syntax '],
                    \ 't': ['SyntasticToggleMode', 'Toggle between Active and Passive modes '],
                    \ 'i': ['SyntasticInfo', 'Get information about Syntax checker '],
                    \ }
    endif
    "}}}
endif
