" ------------------------------------------------------------------------------------
" ------           SuperTab TAB Completions and Color Customizations            ------
" ------------------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType         = 'context'
let g:SuperTabDefaultCompletionType         = "<c-x><c-o>"
let g:SuperTabCrMapping                     = 1
let g:SuperTabLongestEnhanced               = 1
"let g:SuperTabContextTextMemberPatterns     = ['\.', '>\?::', '->', ':']
"let g:SuperTabCompletionContexts            = ['s:ContextText', 's:ContextDiscover']
"let g:SuperTabContextTextOmniPrecedence     = ['&omnifunc', '&completefunc']
"let g:SuperTabContextDiscoverDiscovery      = ['&completefunc:<c-x><c-u>', '&omnifunc:<c-x><c-o>']


" set the required tab based on if running macvim in gui
if has('gui_macvim')
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
    if has('unix') || has('macunix')
        inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
    endif
endif
