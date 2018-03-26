" ------------------------------------------------------------------------------------
" ------           SuperTab TAB Completions and Color Customizations            ------
" ------------------------------------------------------------------------------------
"let g:SuperTabDefaultCompletionType       = '<c-x><c-o>'
" for working in tandem with OmniCompletion
let g:SuperTabContextDefaultCompletionType  = '<c-n>'
"let g:SuperTabDefaultCompletionType         = 'context'
let g:SuperTabDefaultCompletionType         = '<c-n>'
let g:SuperTabContextTextMemberPatterns     = ['\.', '>\?::', '->', ':']
let g:SuperTabContextTextOmniPrecedence     = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery      = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" set the required tab based on if running macvim in gui
if has("gui_running")
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
    if has("unix") || has("macunix")
        inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
    endif
endif
