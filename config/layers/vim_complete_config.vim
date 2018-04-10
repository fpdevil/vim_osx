scriptencoding utf-8
" {{{ vim sources for neocomplete
if has_key(g:plugs, 'neco-vim')
    if !exists('g:necovim#complete_functions')
        let g:necovim#complete_functions = {}
        let g:necovim#complete_functions.Ref = 'ref#complete'
    endif
endif
" }}}

