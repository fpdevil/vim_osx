" ------------------------------------------------------------------------------------
" ---- options for asynchroonus linting engine                                    ----
" ------------------------------------------------------------------------------------
scriptencoding utf-8

if has_key(g:plugs, 'ale')
    let g:ale_emit_conflict_warnings     = 0
    let g:ale_change_sign_column_color   = 0
    let g:ale_open_list                  = 0
    let g:ale_set_quickfix               = 0
    let g:ale_keep_list_window_open      = 0
    let g:ale_list_window_size           = 6
    let g:airline#extensions#ale#enabled = 1

    let g:ale_sign_error                 = '●'
    let g:ale_sign_warning               = '⚠'
    let g:ale_sign_info                  = 'ⓘ'
    let g:ale_sign_column_always         = 0

    let g:ale_echo_msg_error_str         = '✹ Err'
    let g:ale_echo_msg_warning_str       = '⚠ Warn'
    let g:ale_echo_msg_format            = '[%linter%] %s [%severity%]'

    if g:vim_lint_on_the_fly
        let g:ale_lint_on_text_changed   = 'always'         " always = on the fly syntax check
        let g:ale_lint_delay             = 200
    else
        let g:ale_lint_on_text_changed   = 'never'
    endif
    let g:ale_lint_on_insert_leave       = 1                " run linter while leaving insert mode
    let g:ale_set_balloons               = 1                " ballon messages when hovered
    let g:ale_completion_enabled         = 0                " enable completion when available

    " close the loclist window automatically when the buffer is
    " closed
    augroup CloseLoclistWindowGroup
        autocmd!
        autocmd QuitPre * if empty(&buftype) | lclose | endif
    augroup END

    let g:ale_erlang_syntaxerl_executable = '/opt/erlang/syntaxerl/syntaxerl'

    let g:ale_fixers                     = {
                \ 'javascript' : ['eslint', 'prettier'],
                \ 'scss'       : ['stylelint'],
                \ 'html'       : ['tidy'],
                \ 'python'     : ['yapf', 'autopep8'],
                \ 'cpp'        : ['clang-format'],
                \ }

    let g:ale_linters                    = {
                \ 'jsx'        : ['stylelint', 'eslint'],
                \ 'haskell'    : ['hlint', 'ghc', 'ghc-mod', 'stack-ghc', 'stack-ghc-mod', 'stack-build' ],
                \ 'java'       : ['javac'],
                \ }

    let g:ale_linter_aliases = {'jsx': 'css'}

    let g:ale_yaml_yamllint_options = '-d "rules: {line-length: {allow-non-breakable-words: true, max: 300, allow-non-breakable-inline-mappings: true}}"'

    " ALE status line - last empty string = no message when everything is OK
    let g:ale_statusline_format          = [' ⨉ %d ', ' ⚠  %d ', ' OK ']

    " for cpp
    let g:ale_cpp_clang_executable = '/usr/bin/clang'
    let g:ale_cpp_clang_options    = '-std=gnu++1y -stdlib=libc++ -Wall'
    let g:ale_cpp_gcc_options      = '-std=c++1y -stdlib=libc++ -Wall'

    " for highlighting
    highlight link ALEErrorSign Tag
    highlight link ALEWarningSign StorageClass
    highlight clear SignColumn
endif
