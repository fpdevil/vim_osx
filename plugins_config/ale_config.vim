" ------------------------------------------------------------------------------------
" ---- options for asynchroonus linting engine                                    ----
" ------------------------------------------------------------------------------------
if has_key(g:plugs, 'ale')
    let g:ale_sign_column_always         = 1
    let g:ale_sign_error                 = '>>'
    let g:ale_sign_warning               = '--'
    let g:airline#extensions#ale#enabled = 1
    let g:ale_echo_msg_error_str         = 'E'
    let g:ale_echo_msg_warning_str       = 'W'
    let g:ale_echo_msg_format            = '[%linter%] %s [%severity%]'
    let g:ale_lint_on_enter              = 0
    let g:ale_lint_on_save               = 0
    let g:ale_set_quickfix               = 1
    let g:ale_linters                    = {
                \ 'javascript': ['eslint']
                \ }
endif
