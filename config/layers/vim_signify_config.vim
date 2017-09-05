" vim-signify
" Show a diff using Vim its sign column
if has_key(g:plugs,'vim-signify')
    let g:signify_disable_by_default = 0
    let g:signify_vcs_list = ['git']
    let g:signify_skip_filetype = { 'journal': 1 }
endif
