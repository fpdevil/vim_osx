" ------------------------------------------------------------------------------------
" ----------  Vim Autocomplete configuration with omnifunc and completefunc ----------
" ------------------------------------------------------------------------------------

" {{{ settings for enabling the OmniCompletion for various languages
"     set omnifunc=syntaxcomplete#Complete

augroup Completions
    autocmd!
    autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
    "autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif

    autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd Filetype erlang        setlocal omnifunc=erlang_complete#Complete
    autocmd Filetype ruby          setlocal omnifunc=rubycomplete#Complete
    " using tern completion instead of CompleteJS
    autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
    " for c/cpp
    autocmd FileType c             setlocal omnifunc=ccomplete#CompleteCpp
    "autocmd FileType c set omnifunc=ccomplete#Complete
    " for java
    autocmd FileType java          setlocal omnifunc=javacomplete#Complete
    autocmd FileType java          setlocal completefunc=javacomplete#CompleteParamsInfo
augroup END

if has('python3')
    augroup py
        autocmd!
        " allow jedi and neocomp activated together
        autocmd FileType python setlocal omnifunc=python3complete#Complete
    augroup end
else
    augroup py
        autocmd!
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    augroup end
endif

" color settings for popup menu's
"hi Pmenu       guifg=white   guibg=brown gui=bold ctermbg=0 ctermfg=6
"hi PmenuSbar   guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
"hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" }}}

