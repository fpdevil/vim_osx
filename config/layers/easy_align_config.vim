" ------------------------------------------------------------------------------------
" --------------------- Alignment Helper, Easy align interactive ---------------------
" ------------------------------------------------------------------------------------
let g:easy_align_delimiters = {
    \ '>': { 'pattern': '>>\|=>\|>' },
    \ '\': { 'pattern': '\\' },
    \ '/': { 'pattern': '//\+\|/\*\|\*/', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] },
    \ ']': {
    \     'pattern':       '\]\zs',
    \     'left_margin':   0,
    \     'right_margin':  1,
    \     'stick_to_left': 0
    \   },
    \ ')': {
    \     'pattern':       ')\zs',
    \     'left_margin':   0,
    \     'right_margin':  1,
    \     'stick_to_left': 0
    \   },
    \ 'f': {
    \     'pattern': ' \(\S\+(\)\@=',
    \     'left_margin': 0,
    \     'right_margin': 0
    \   },
    \ 'd': {
    \     'pattern': ' \ze\S\+\s*[;=]',
    \     'left_margin': 0,
    \     'right_margin': 0
    \   }
    \ }


vnoremap <silent> <Enter> :EasyAlign<cr>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a vim motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" --- type ° to search the word in all files in the current dir (Silver search
nmap ° :Ag <c-r>=expand("<cword>")<cr><cr>
