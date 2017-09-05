" #############################################################################
" # This file contains any custom settings or key mappings for vim
" #############################################################################

" # mappings for moving lines and words {{{
"   push line UP and DOWN
"nnoremap <leader><Down> ddp
"nnoremap <leader><Up> ddkP

"   push word under cursor to left and right
nnoremap <leader><Left> "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o><C-l>
nnoremap <leader><Right> "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>/\w\+\_W\+<CR><C-l>
" }}}
