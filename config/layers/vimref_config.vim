" settings for vim-ref plug
if has_key(g:plugs,'vim-ref')
    let g:ref_use_vimproc         = 1
    let g:ref_open                = 'split'
    let g:ref_cache_dir           = expand($TMPDIR . '/vim_ref_cache/')
    let g:ref_pydoc_cmd           = 'python3 -m pydoc'
    let g:ref_pydoc_complete_head = 1
    "nno <leader>K :<C-u>Unite ref/erlang -vertical -default-action = split<CR>
    if has_key(g:lmap,'l')
        let g:lmap.l.u = {
                    \ 'name': 'Unite Reference ',
                    \ 'e' : ['Unite ref/erlang -vertical -default-action=split'  , 'Erlang Reference '],
                    \ 'p' : ['Unite ref/pydoc -vertical -default-action=split'   , 'Python Reference '],
                    \ 'c' : ['Unite ref/clojure -vertical -default-action=split' , 'Clojure Reference '],
                    \ 'm' : ['Unite ref/man -vertical -default-action=split'     , 'Man page Reference '],
                    \ }
    endif
endif
