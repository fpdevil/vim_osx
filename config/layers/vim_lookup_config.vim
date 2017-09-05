" configuration settings for vim-lookup
" Usage
" Use lookup#lookup() to jump to the defintion of the identifier under the cursor.
" Use lookup#pop() (or the default mapping <c-o>) to jump back.

if has_key(g:plugs, 'vim-lookup')
    autocmd FileType vim nnoremap <buffer><silent> <cr>  :call lookup#lookup()<cr>
endif
