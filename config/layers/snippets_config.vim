" ====================================================================================
" ------              key bindings for UltiSnipsExpandTrigger                   ------
" ====================================================================================


" ====================================================================================
"     select the directory location for common snippets
" ====================================================================================
if isdirectory(expand('~/.vim/plugged/ultisnips'))
    let g:UltiSnipsSnippetsDir        = $HOME . '/.vim/snippets'
    let g:UltiSnipsSnippetsDir        = $HOME . '/.vim/plugged/vim-snippets/UltiSnips'
    let g:UltiSnipsSnippetDirectories = [ '~/.vim/plugged/vim-snippets/UltiSnips', 'UltiSnips' ]
    if has('python3')
        let g:UltiSnipsUsePythonVersion = 3
    else
        let g:UltiSnipsUsePythonVersion = 2
    endif


    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit           = 'vertical'
    let g:UltiSnipsExpandTrigger       = '<tab>'
    let g:UltiSnipsJumpForwardTrigger  = '<c-z>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-p>'
    let g:UltiSnipsListSnippets        = '<c-k>' "List possible snippets based on current file
endif

" ====================================================================================
" snipmate customization
" ====================================================================================
let g:snips_author             = 'Sampath Singamsetty'
let g:snipMateAllowMatchingDot = 0

" ====================================================================================
"  vim-snipmate settings for ycm running in guimode
"  to prevent clash with youcompleteme, change snippet trigger
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

    " plugin key-mappings (type Ctrl-Z to expand)
    imap <C-z>     <Plug>(neosnippet_expand_or_jump)
    smap <C-z>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-z>     <Plug>(neosnippet_expand_target)

    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " for snippet_complete marker
    if has('conceal')
        set conceallevel=1 concealcursor=i
    endif

    " enable snipmate compatibility features
    let g:neosnippet#enable_snipmate_compatibility = 1

    " let neosnippet know about other snippets
    if filereadable(expand('~/.vim/plugged/vim-snippets/snippets'))
        let g:neosnippet#snippets_directory = '~/.vim/plugged/vim-snippets/snippets/,~/.vim/snippets'
    endif
endif

let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
    let l:snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return l:snippet
    else
        return "\<C-Y>"
    endif
endfunction
