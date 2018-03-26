" ------------------------------------------------------------------------------
"  for proper javascript indentation
" ------------------------------------------------------------------------------
setlocal autoindent
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal conceallevel=1

" set up native eslint making so we can debug eslint configs
setlocal makeprg=npx\ eslint\ -f\ compact\ %
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m
setlocal errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m
setlocal errorformat+=%-G\s%#
setlocal errorformat+=%-G\s%#%\\d%\\+\ problems%#

setlocal foldmethod=marker
setlocal foldmarker=/*,*/

highlight jsArrowFunction      ctermfg=197 cterm=bold guifg=#F92672 gui=bold
highlight jsBrackets                       cterm=bold               gui=bold
highlight jsClassBraces        ctermfg=197 cterm=bold guifg=#F92672 gui=bold
highlight jsDestructuringBlock ctermfg=194 cterm=bold guifg=#AAFFAA gui=bold
highlight jsFuncBraces         ctermfg=118            guifg=#A6E22E
highlight jsFuncCall           ctermfg=228            guifg=#A6A5AE
highlight jsModuleBraces       ctermfg=14  cterm=bold guifg=#0099FF gui=bold
highlight jsModuleKeyword      ctermfg=225            guifg=#FFBBBB
highlight jsNoise              ctermfg=197 cterm=bold guifg=#F92672 gui=bold
highlight jsObjectBraces       ctermfg=197 cterm=bold guifg=#F92672 gui=bold
highlight jsVariableDef        ctermfg=194 cterm=bold guifg=#AAFFAA gui=bold


" aggregate checks from multiple linters and checkers
let syntastic_aggregate_errors = 1
