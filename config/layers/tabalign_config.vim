"------------------------------------------------------------------------------------
"-----                      for tab alignment configuration                     -----
"------------------------------------------------------------------------------------
if has_key(g:plugs, 'tabular')
    let g:haskell_tabular = 1
    vmap <leader>a= :Tabularize /=<CR>
    vmap <leader>a: :Tabularize /::<CR>
    vmap <leader>ac :Tabularize /:<CR>
    vmap <leader>as :Tabularize /;<CR>
    vmap <leader>a> :Tabularize /-><CR>
    vmap <leader>a< :Tabularize /<-<CR>
    vmap <leader>a, :Tabularize /,<CR>
    vmap <leader>a. :Tabularize /.<CR>
    vmap <leader>a& :Tabularize /&<CR>
    vmap <leader>a( :Tabularize /(<CR>
    vmap <leader>a) :Tabularize /)<CR>
    vmap <leader>a{ :Tabularize /{<CR>
    vmap <leader>a} :Tabularize /}<CR>
    vmap <leader>a[ :Tabularize /[<CR>
    vmap <leader>a] :Tabularize /]<CR>
endif
