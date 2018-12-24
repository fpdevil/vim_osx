" ------------------------------------------------------------------------------------
" settings for highlight cursor word underlines all occurances of a word in the buffer
" ------------------------------------------------------------------------------------

if has_key(g:plugs, 'vim-brightest')
    " if the below is uncommented, instead of highlight it underlines
    "let g:brightest#highlight = {
    "            \ "group": "BrightestUnderline",
    "            \ }
    
    let g:brightest#pattern = '\k\+'
endif

if has_key(g:plugs, 'vim-illuminate')
    " time in milliseconds (default 250)
    let g:Illuminate_delay = 125
endif
