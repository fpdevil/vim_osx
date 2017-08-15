" ------------------------------------------------------------------------------------
" -------   START Configuration settings for vim-go golang support             -------
" ------------------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.go setl filetype=go nolist noexpandtab syntax=go
"autocmd FileType go setlocal completefunc=youcompleteme#Complete
"setlocal omnifunc=go#complete#Complete

augroup filetypedetect_go
  au Filetype go nnoremap <leader>gd :vsp <CR>:exe "GoDef" <CR>
  au Filetype go nnoremap <leader>gc :vsp <CR>:exe "GoCallees" <CR>
  " au Filetype go nnoremap <leader>gr :vsp <CR>:exe "GoReferrers" <CR>
  " au Filetype go nnoremap <leader>gimp :vsp <CR>:exe "GoImplements" <CR>
  au Filetype go nnoremap <leader>gdt :tab split <CR>:exe "GoDef"<CR>
  au FileType go nmap <Leader>gi <Plug>(go-info)
  au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  au FileType go nmap <Leader>gr <Plug>(go-rename)
augroup END

let g:go_bin_path = expand("$GOPATH/bin")

if has_key(g:plugs, 'vim-go')
    let g:go_disable_autoinstall         = 1
    let g:go_highlight_functions         = 1
    let g:go_highlight_methods           = 1
    let g:go_highlight_fields            = 1
    let g:go_highlight_types             = 1
    let g:go_highlight_structs           = 1
    let g:go_highlight_operators         = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_command                 = "goimports"
    let g:go_def_mode                    = "godef"
    let g:go_play_open_browser           = 0
    " syntastic checking for go
    "let g:syntastic_go_chckers          = ['golint']
    let g:syntastic_go_checkers          = ['go', 'golint', 'errcheck']
    let g:go_list_type                   = "quickfix"
endif


augroup go
  autocmd!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END


" Tagbar settings for go {{{
" get gtags first go get -u github.com/jstemmer/gotags
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }
"}}}

"{{{ for go code with youcompleteme
if has_key(g:plugs,'youcompleteme')
    let g:ycm_gocode_binary_path = expand("$GOPATH/bin/gocode")
    let g:ycm_godef_binary_path  = expand("$GOPATH/bin/godef")
    " shortcut mappings for gocode
    nnoremap <leader>yt :YcmCompleter GetType<cr>
    nnoremap <leader>yd :YcmCompleter GetDoc<cr>
    nnoremap <leader>yo :YcmCompleter GoTo<cr>
    nnoremap <leader>yf :YcmCompleter GoToDefinition<cr>
    nnoremap <leader>yr :YcmCompleter GoToReferences<cr>
    nnoremap <leader>yc :YcmCompleter ClearCompilationFlagCache<cr>
endif
"}}}
