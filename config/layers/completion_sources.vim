" -----------------------------------------------------------------------------
"  syntax and completion sources for neocomplete / deoplete
" -----------------------------------------------------------------------------

" for neco-syntax
if has_key(g:plugs,'neco-syntax')
    let g:necosyntax#min_keyword_length = 1
endif

" for neoinclude
if has_key(g:plugs,'neoinclude.vim')
    if !exists('g:neoinclude#exts')
        let g:neoinclude#exts = {}
    endif
    let g:neoinclude#exts.cpp = ['', 'h', 'hpp', 'hxx']
endif
