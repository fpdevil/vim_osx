" ------------------------------------------------------------------------------------
" ---                               for erlang                                     ---
" ------------------------------------------------------------------------------------
" for erlang development - syntax checking through syntaxerl
let g:syntastic_erlang_checkers   = ['/opt/erlang/syntaxerl/syntaxerl']
let g:syntastic_erlc_include_path = "ebin"
let g:erlangManPath               = '/usr/local/opt/erlang/lib/erlang/man' " erlang man pages
let g:erlangCompiler              = "erlc"
let g:erlangWranglerPath          = "/usr/local/lib/erlang/lib/wrangler-1.2.0/"
let g:erlang_show_errors          = 1
let g:erlang_use_conceal          = 1
let g:erlangHighlightBif          = 1
let g:erlangCompletionDisplayDoc  = 1
let g:erlangCompletionGrep        = 1


" autocmd FileType erlang set omnifunc=erlangcomplete#Complete
autocmd FileType erlang setlocal completefunc=erlangcomplete#Complete
autocmd FileType erlang set ai sw=2 st=2 ts=2 et

let erlang_path=substitute(system("which erl"), "/bin/erl", "/lib/**/src/", "")

" function for prettifying the erlang code
"Function: ErlPretty
"Desc: use the erl_tidy module for prettifying the buffer
"
"Arguments: nil (current buffer)
"
function! ErlPretty()
    silent !erl -noshell -eval 'erl_tidy:file("%", [verbose]).' -s erlang halt
endfunction

nmap ep :execute ErlPretty()
