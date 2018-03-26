" vim-signify
" Show a diff using Vim its sign column
if has_key(g:plugs,'vim-signify')
    let g:signify_disable_by_default = 0
    let g:signify_vcs_list           = ['git']
    let g:signify_skip_filetype      = { 'journal': 1 }
    " using some nicer colors
    highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
    highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
    highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
    highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
    highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
    highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
endif
