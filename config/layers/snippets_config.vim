" ====================================================================================
" ------              key bindings for UltiSnipsExpandTrigger                   ------
" ====================================================================================


" ====================================================================================
"     select the directory location for common snippets
" ====================================================================================
if isdirectory(expand('~/.vim/plugged/ultisnips'))
    "let g:UltiSnipsSnippetsDir        = $HOME . '/.vim/snippets'
    let g:UltiSnipsSnippetsDir        = '~/.vim/plugged/vim-snippets/UltiSnips'
    let g:UltiSnipsSnippetDirectories = [ 'UltiSnips' ]
    if has('python3')
        let UltiSnipsUsePythonVersion     = 3
    else
        let UltiSnipsUsePythonVersion     = 2
    endif


    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit           = "vertical"
    let g:UltiSnipsExpandTrigger       = '<tab>'
    let g:UltiSnipsJumpForwardTrigger  = '<c-b>'
    let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
endif

" ====================================================================================
" snipmate customization
" ====================================================================================
let g:snips_author             = 'Sampath Singamsetty'
let g:snipMateAllowMatchingDot = 0

" ====================================================================================
"  vim-snipmate settings for ycm running in guimode
" ====================================================================================
if has('gui_running')
    imap <C-J> <Plug>snipMateNextOrTrigger
    smap <C-J> <Plug>snipMateNextOrTrigger
endif

" ====================================================================================
" neosnippet settings if available
" ====================================================================================
if isdirectory(expand('~/.vim/plugged/neosnippet.vim'))
    " enable function snippet expansion
    let g:neosnippet#enable_completed_snippet = 1

    " plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
          \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " for snippet_complete marker
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif

    " enable snipmate compatibility features
    let g:neosnippet#enable_snipmate_compatibility = 1

    " let neosnippet know about other snippets
    if filereadable(expand("~/.vim/plugged/vim-snippets/snippets"))
        let g:neosnippet#snippets_directory = '~/.vim/plugged/vim-snippets/snippets/,~/.vim/snippets'
    endif
endif

let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<C-Y>"
    endif
endfunction
