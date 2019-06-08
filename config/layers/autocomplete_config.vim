" ------------------------------------------------------------------------------------
" ----------  Vim Autocomplete configuration with omnifunc and completefunc ----------
" ------------------------------------------------------------------------------------

" enable omni-completion.
if has('autocmd') && exists('+omnifunc')
    autocmd vimrc Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

" {{{ settings for enabling the OmniCompletion for various languages
"     set omnifunc=syntaxcomplete#Complete

augroup Completions
    autocmd!
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

    autocmd FileType css setlocal           omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType xml setlocal           omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal          omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal       omnifunc=necoghc#omnifunc
    autocmd FileType javascript setlocal    omnifunc=tern#Complete
    "autocmd FileType javascript setlocal   omnifunc=javascriptcomplete#CompleteJS
    if has('python3')
        if has_key(g:plugs,'jedi-vim')
            autocmd FileType python setlocal omnifunc=jedi#completions
        else
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
hi Pmenu      cterm=none    ctermbg=DarkMagenta  ctermfg=LightYellow  guibg=#6b8e23 guifg=white
hi PmenuSel   cterm=none    ctermbg=DarkGreen    ctermfg=yellow       guibg=#fcaf3e guifg=black
hi PmenuSbar  ctermbg=none  ctermfg=grey         guibg=#729fcf        guifg=white
hi PmenuThumb ctermfg=cyan  guibg=#729fcf        guifg=white
hi WildMenu   ctermbg=cyan  guibg=#edd400        guifg=#729fcf

" }}}

