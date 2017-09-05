" ------------------------------------------------------------------------------------
" ----------  Vim Autocomplete configuration with omnifunc and completefunc ----------
" ------------------------------------------------------------------------------------

" {{{ settings for enabling the OmniCompletion for various languages
"     set omnifunc=syntaxcomplete#Complete
autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c             set      omnifunc=ccomplete#CompleteCpp
autocmd Filetype erlang        setlocal omnifunc=erlang_complete#Complete
"autocmd FileType c set omnifunc=ccomplete#Complete
" using tern completion instead of CompleteJS
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

if has('python3')
    autocmd FileType python setlocal omnifunc=python3complete#Complete
else
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
endif
" }}}

