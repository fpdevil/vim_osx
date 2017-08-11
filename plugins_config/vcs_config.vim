" ------------------------------------------------------------------------------------
" ---------------------- custom settings for the vim git gutter ----------------------
" ------------------------------------------------------------------------------------
highlight clear SignColumn
highlight SignColumn ctermbg=0
nmap gn <Plug>GitGutterNextHunk
nmap gN <Plug>GitGutterPrevHunk
let g:gitgutter_realtime = 0
