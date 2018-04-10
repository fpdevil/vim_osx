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
    hi CtrlSpaceSearch guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
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
