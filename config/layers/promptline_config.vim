if has_key(g:plugs, 'promptline.vim')
    "let g:promptline_preset = 'powerlineclone'
    let g:promptline_theme = 'powerlineclone'
    let g:promptline_preset = {
        \'a' : [ promptline#slices#host({ 'only_if_ssh': 1 }), '$USER' ],
        \'b' : [ promptline#slices#cwd() ],
        \'warn' : [ promptline#slices#last_exit_code() ],
        \'x' : [ promptline#slices#git_status() ],
        \'y' : [ '$(git rev-parse --short HEAD 2>/dev/null)', promptline#slices#vcs_branch() ],
        \'z' : [ '%*' ],
        \ }
endif
