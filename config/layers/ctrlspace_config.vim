" ------------------------------------------------------------------------------------
" ---------              CtrlSpace customization settings                    ---------
" ---------  getting help with the below options                             ---------
" ---------  :help g:CtrlSpaceSymbols                                        ---------
" ------------------------------------------------------------------------------------

if !empty(glob('~/.vim/plugged/vim-ctrlspace'))
    if has("gui_running")
        " Settings for MacVim and powerline font
        let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
    endif

    hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
    hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
    hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
    hi CtrlSpaceStatus   ctermfg=230  ctermbg=234  cterm=NONE

    if executable("ag")
        let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
    endif
    let g:CtrlSpaceUseUnicode         = 1
    let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
    "if has_key(g:plugs,'vim-airline')
    if !exists("g:airline#extensions#ctrlspace#enabled")
        let g:airline#extensions#ctrlspace#enabled = 1
    endif
endif
