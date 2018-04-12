" ------------------------------------------------------------------------------------
" ------------- Clojure language customization with rainbow parenthesis  -------------
" ------------------------------------------------------------------------------------
" rainbow parentheses
if exists('RainbowParenthesesActivate')
    autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesActivate
    autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadRound
    autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadSquare
    autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadBraces
endif

" Clojure file options
function SetCljFtOptions()
    setlocal filetype=clojure
    setlocal autoindent
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
endfunction
"autocmd BufNewFile,BufRead *.clj call SetCljFtOptions()
"autocmd BufNewFile,BufRead *.cljs call SetCljFtOptions()
"autocmd BufNewFile,BufRead *.cljx call SetCljFtOptions()
"autocmd BufNewFile,BufRead *.cljc call SetCljFtOptions()
"autocmd BufNewFile,BufRead *.pxi call SetCljFtOptions()

" clojure format
if !empty(glob('~/.vim/plugged/vim-cljfmt'))
    let g:clj_fmt_autosave = 0
    "autocmd vimrc BufWritePre *.clj call cljfmt#AutoFormat()
    "autocmd vimrc BufWritePre *.cljc call cljfmt#AutoFormat()
endif

" .ymd file type handling
autocmd BufEnter *.ymd set filetype=markdown
autocmd BufEnter *.cljs,*.cljs.hl set filetype=clojure
"  Reload the browser on cljs save
"  don't forget to put <script src="http://localhost:9001/ws"></script>
"  in your HTML
"  au BufWritePost *.cljs :BCReloadPage

" vim-clojure-static settings
if has_key(g:plugs,'vim-clojure-static')
    set lispwords+=match
    let g:clojure_maxlines                         = 60
    let g:clojure_fuzzy_indent_patterns            = ['^with', '^def', '^let']
    let g:neocomplete#force_overwrite_completefunc = 1
endif

" paredit settings
if !empty(glob('~/.vim/plugged/paredit'))
    let g:paredit_smartjump = 1
endif

" neoclojure
if has_key(g:plugs,'neoclojure.vim')
    augroup vimrc-neoclojure
        autocmd!
        " If you use neocomplete
        autocmd FileType clojure setlocal omnifunc=neoclojure#complete#omni_auto
        autocmd FileType clojure nnoremap <Space><M-r> :<C-u>call neoclojure#killall()<Cr>
        " otherwise
        "autocmd FileType clojure setlocal omnifunc=neoclojure#complete#omni
    augroup END
    let g:neoclojure_autowarmup = 1
else
    setlocal omnifunc=vimclojure#OmniCompletion
endif

" REPL Settings {{{
" connect vim fireplace to browser repl
" 1. Start repl (lein repl or :Console)
" 2. Start web app in repl (e.g. (run) when using a chestnut lein template)
" 3. Open cljs buffer in vim.
" 4. Connect to repl using commands (e.g. :Wiggie)
" 5. Evaluate expressions in my buffer, and see live changes in the browser!
command! Piggie :Piggieback (cemerick.austin/exec-env)
command! Biggie :Piggieback (cemerick.austin/exec-env :exec-cmds ["open" "-ga" "/Applications/Google Chrome.app"])
command! Wiggie :Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001) 

" -- Get doc string from repl
"Function: GetReplDoc
"Desc: documentation from repl
"
"Arguments: symbol
"
function! GetReplDoc(symbol)
    exec "Eval (clojure.repl/doc) " a:symbol ")"
endfunction

nnoremap <silent> RD :call <SID>GetReplDoc(expand('<cword>'))<CR>
" }}}
