" ------------------------------------------------------------------------------------
" ------           SuperTab TAB Completions and Color Customizations            ------
" ------------------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
" for working in tandem with OmniCompletion
let g:SuperTabDefaultCompletionType = 'context'

" set the required tab based on if running macvim in gui
if has("gui_running")
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
    if has("unix")
        inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
    endif
endif
