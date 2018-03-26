" ------------------------------------------------------------------------------------
" ------------- Clojure language customization with rainbow parenthesis  -------------
" ------------------------------------------------------------------------------------
" Clojure
if exists('RainbowParenthesesActivate')
  autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesActivate
  autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadRound
  autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadSquare
  autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadBraces
endif

" Fix I don't know why
autocmd BufEnter *.cljs,*.clj,*.cljs.hl setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:

" .ymd file type handling
autocmd BufEnter *.ymd set filetype=markdown
autocmd BufEnter *.cljs,*.cljs.hl set filetype=clojure
"  Reload the browser on cljs save
"  don't forget to put <script src="http://localhost:9001/ws"></script>
"  in your HTML
"  au BufWritePost *.cljs :BCReloadPage

" neoclojure
if has_key(g:plugs,'neoclojure.vim')
    augroup vimrc-neoclojure
        autocmd!
        " If you use neocomplete
        autocmd FileType clojure setlocal omnifunc=neoclojure#complete#omni_auto
        " Otherwise
        autocmd FileType clojure setlocal omnifunc=neoclojure#complete#omni
    augroup END
endif
