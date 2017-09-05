" ------------------------------------------------------------------------------------
" ------              key bindings for UltiSnipsExpandTrigger                   ------
" ------------------------------------------------------------------------------------
" {{{
"     select the directory location for common snippets
"let g:UltiSnipsSnippetsDir        = $HOME . '/.vim/snippets'
let g:UltiSnipsSnippetsDir        = '~/.vim/plugged/vim-snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories = [ 'UltiSnips' ]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit           = "vertical"
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

" }}}

"{{{ snipmate
let g:snips_author             = 'Sampath Singamsetty'
let g:snipMateAllowMatchingDot = 0
"}}}

"{{{ vim-snipmate settings for ycm
if has('gui_running')
    imap <C-J> <Plug>snipMateNextOrTrigger
    smap <C-J> <Plug>snipMateNextOrTrigger
endif
"}}}

"{{{ neosnippet settings
if has_key(g:plugs,'neosnippet.vim')
    let g:neosnippet#enable_snipmate_compatibility = 1
    if filereadable(expand("~/.vim/plugged/vim-snippets/snippets"))
        let g:neosnippet#snippets_directory = "~/.vim/plugged/vim-snippets/snippets"
    endif
endif
"}}}
