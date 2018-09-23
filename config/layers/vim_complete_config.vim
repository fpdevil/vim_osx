scriptencoding utf-8
" {{{ vim sources for neocomplete
if has_key(g:plugs, 'neco-vim')

    function! s:get_input() abort
        let l:col = col( '.' )
        let l:line = getline( '.' )
        if l:col - 1 < len( l:line )
            return matchstr( l:line, '^.*\%' . l:col . 'c' )
        endif
        return l:line
    endfunction

    function! vim_complete_config#vim_complete(findstart, base) abort
        let l:line_prefix = s:get_input()
        if a:findstart
            let l:ret = necovim#get_complete_position(l:line_prefix)
            if l:ret < 0
                return col( '.' ) " default to current
            endif
            return l:ret
        else
            let l:candidates = necovim#gather_candidates(l:line_prefix . a:base, a:base)
            let l:filtered_candidates = []
            for l:candidate in l:candidates
                if l:candidate.word =~? '^' . a:base
                    call add(l:filtered_candidates, l:candidate)
                endif
            endfor
            return l:filtered_candidates
        endif
    endfunction

    augroup vim_complete
        autocmd!
        au FileType vim setlocal omnifunc=vim_complete_config#vim_complete
    augroup END

    if !exists('g:necovim#complete_functions')
        let g:necovim#complete_functions = {}
        let g:necovim#complete_functions.Ref = 'ref#complete'
    endif
endif
" }}}

