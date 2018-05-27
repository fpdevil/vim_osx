" -----------------------------------------------------------------------------
" --- vim typescript settings                                               ---
" -----------------------------------------------------------------------------
au BufRead,BufNewFile *.ts  setlocal filetype=typescript

" vim typescript syntax settings
if isdirectory(expand('~/.vim/plugged/typescript-vim'))
    let g:typescript_compiler_binary  = 'tsc'
    let g:typescript_compiler_options = ''
    augroup vim_ts
        autocmd QuickFixCmdPost [^l]* nested cwindow
        autocmd QuickFixCmdPost    l* nested lwindow
    augroup END
endif

" highlight JavaScript's Template Strings in other FileType syntax rule
if isdirectory(expand('~/.vim/plugged/vim-js-pretty-template'))
    augroup vim_ts
        autocmd FileType typescript JsPreTmpl html
        autocmd FileType typescript syn clear foldBraces
    augroup END
endif
