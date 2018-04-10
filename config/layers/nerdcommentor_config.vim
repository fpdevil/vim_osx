" ------------------------------------------------------------------------------------
" ------                     NerdCommenter customizations                       ------
" ------------------------------------------------------------------------------------
" {{{
"if has_key(g:plugs, 'nerdcommenter')
if !empty(glob('~/.vim/plugged/nerdcommenter'))
    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines      = 1
    " Always remove extra spaces when uncommenting regardless of NERDSpaceDelims being set
    let g:NERDRemoveExtraSpaces      = 1
    " Enable trimming of trailing whitespace when un-commenting
    let g:NERDTrimTrailingWhitespace = 1
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims            = 1
    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs        = 1
    " Always use alternative delimiter
    let g:NERD_c_alt_style           = 1
    let g:NERDCustomDelimiters       = {'c': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }}
endif
" }}}
