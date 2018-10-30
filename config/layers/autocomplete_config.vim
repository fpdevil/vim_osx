" ------------------------------------------------------------------------------------
" ----------  Vim Autocomplete configuration with omnifunc and completefunc ----------
" ------------------------------------------------------------------------------------

" {{{ settings for enabling the OmniCompletion for various languages
"     set omnifunc=syntaxcomplete#Complete

augroup Completions
    autocmd!
    "autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
    "autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif

    autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS        " css
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags      " html/markdown
    autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags       " xml
    autocmd Filetype erlang        setlocal omnifunc=erlang_complete#Complete       " erlang
    autocmd Filetype ruby          setlocal omnifunc=rubycomplete#Complete          " ruby
    autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS  " using tern instead
    autocmd FileType c             setlocal omnifunc=ccomplete#CompleteCpp          " c/cpp
    autocmd FileType java          setlocal omnifunc=javacomplete#Complete          " java
    autocmd FileType java          setlocal completefunc=javacomplete#CompleteParamsInfo
augroup END


augroup py
    autocmd!
    if has('python3')
        if has_key(g:plugs,'jedi-vim')
            autocmd FileType python setlocal omnifunc=jedi#completions
        else
            " allow jedi and neocomp activated together
            autocmd FileType python setlocal omnifunc=python3complete#Complete
        endif
    else
        " has python 2.x.x
        if has_key(g:plugs,'jedi-vim')
            autocmd FileType python setlocal omnifunc=jedi#completions
        else
            autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        endif
    endif
augroup END

" color settings for popup menu's
"hi Pmenu       guifg=white   guibg=brown gui=bold ctermbg=0 ctermfg=6
"hi PmenuSbar   guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
"hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" }}}

