" ====================================================================================
" ------              key bindings for UltiSnipsExpandTrigger                   ------
" ====================================================================================


" ====================================================================================
"     select the directory location for common snippets
" ====================================================================================
if has_key(g:plugs,'ultisnips')
  "let g:UltiSnipsSnippetsDir        = $HOME . '/.vim/snippets'
  let g:UltiSnipsSnippetsDir        = '~/.vim/plugged/vim-snippets/UltiSnips'
  let g:UltiSnipsSnippetDirectories = [ 'UltiSnips' ]
  let UltiSnipsUsePythonVersion     = 3

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit           = "vertical"
  let g:UltiSnipsExpandTrigger       = '<tab>'
  let g:UltiSnipsJumpForwardTrigger  = '<tab>'
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
if has_key(g:plugs,'neosnippet.vim')
    " plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " super-tab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
          \ "\<Plug>(neosnippet_expand_or_jump)"
          \ : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
          \ "\<Plug>(neosnippet_expand_or_jump)"
          \ : "\<TAB>"

    " for snippet_complete marker
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
    " enable snipmate compatibility features
    let g:neosnippet#enable_snipmate_compatibility = 1
    " let neosnippet know about other snippets
    if filereadable(expand("~/.vim/plugged/vim-snippets/snippets"))
        let g:neosnippet#snippets_directory = "~/.vim/plugged/vim-snippets/snippets"
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
imap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "<Plug>delimitMateCR"
