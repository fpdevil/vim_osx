" ------------------------------------------------------------------------------------
" ---                               for erlang                                     ---
" ------------------------------------------------------------------------------------
" for erlang development - syntax checking through syntaxerl
let g:syntastic_erlang_checkers   = ['/opt/erlang/syntaxerl/syntaxerl']
let g:syntastic_erlc_include_path = "ebin"
let g:erlangManPath               = '/usr/local/opt/erlang/lib/erlang/man' " erlang man pages
let g:erlangCompiler              = "erlc"
let g:erlang_show_errors          = 1
let g:erlang_use_conceal          = 1
let g:erlangHighlightBif          = 1
let g:erlangCompletionDisplayDoc  = 1
let g:erlangCompletionGrep        = 1


" autocmd FileType erlang set omnifunc=erlangcomplete#Complete
autocmd FileType erlang set ai sw=2 st=2 ts=2 et

let erlang_path=substitute(system("which erl"), "/bin/erl", "/lib/**/src/", "")
"autocmd FileType erlang setlocal completeopt+=menu,menuone,preview

" tags
set tags+=/usr/local/Cellar/erlang/20.0/lib/erlang/lib/tags
