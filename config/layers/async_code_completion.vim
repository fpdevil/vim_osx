" ------------------------------------------------------------------------------------
" ---- vim async code completion settings                                         ----
" ------------------------------------------------------------------------------------
if (!has('gui_running'))
    if has_key(g:plugs, 'completor')
        let g:completor_python_binary    = "/usr/local/bin/python3"
        let g:completor_node_binary      = "/usr/local/bin/node"
        let g:completor_clang_binary     = "/usr/bin/clang"
        let g:completor_gocode_binary    = "/usr/local/opt/go/libexec/bin/go"
        let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
        " Use Tab to trigger completion (disable auto trigger)
        " let g:completor_auto_trigger   = 0
        " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
    endif
endif
