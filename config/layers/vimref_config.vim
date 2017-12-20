" settings for vim-ref plug
if has_key(g:plugs,'vim-ref')
    let g:ref_use_vimproc = 1
    let g:ref_open        = 'split'
    let g:ref_cache_dir   = expand($TMPDIR . '/vim_ref_cache/')
    nno <leader>K :<C-u>Unite ref/erlang
                \ -vertical -default-action=split<CR>
endif
