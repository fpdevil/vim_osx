"------------------------------------------------------------------------------------
"-----                      for tab alignment configuration                     -----
"------------------------------------------------------------------------------------
if has_key(g:plugs, 'tabular')
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
