"{{{ for vim leader guide
"let g:lmap        = {}
let g:lmap = get(g:, 'lmap', {})
let g:lmap.f      = { 'name' : '+File Menu ' }
let g:lmap.o      = { 'name' : '+Open Stuff ' }
let g:lmap.c      = { 'name' : '+Comments ' }
let g:lmap.u      = { 'name' : '+Unite Family ' }

let g:lmap.c.c    = ['call feedkeys("\<Plug>NERDCommenterComment")','Comment ']
let g:lmap.c[' '] = ['call feedkeys("\<Plug>NERDCommenterToggle")','Toggle ']

" provide commans and details of existing mappings
let g:lmap.f.v = {
            \ 'name': 'ViM Files ',
            \ 'v'   : ['tabnew $MYVIMRC', 'Edit vimrc file in new tab '],
            \ 's'   : ['so %', 'Source a .vim file '],
            \ 'f'   : ['copen', 'Open quickfix '],
            \ 'l'   : ['lopen', 'Open locationlist '],
            \ 'w'   : ['w', 'Write file '],
            \ }

" for +Utilities and Tools
let g:lmap.t = {
            \ 'name': '+Tools and Utilities ',
            \ }

" for +Miscelleaneous apps and tools
let g:lmap.m = {
            \ 'name': "+Misc Apps ",
            \ }

" for +Files
let g:lmap.m.f = {
            \ 'name' : '+File Tools ',
            \ }

" for general utilities
let g:lmap.m.u = {
            \ 'name' : '+Utilities and Tools Section ',
            \ }

" completion related tools
let g:lmap.m.c = {
            \ 'name' : 'Auto Completion Tools ',
            \ }

" language helper tools and utilities
let g:lmap.l = {
            \ 'name' : '+Language specific ',
            \ }

" file writing / note taking / ditraction free writing etc
let g:lmap.w = {
            \ 'name' : '+Writing/Note/Distraction free ',
            \ }

if isdirectory(expand("~/.vim/plugged/vim-leader-guide/"))
    " to make the guide pop up Register the description dictionary for the prefix first
    call leaderGuide#register_prefix_descriptions("-", "g:lmap")
    nnoremap <silent> <leader> :<c-u>LeaderGuide '-'<CR>
    vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '-'<CR>

    " Leaderguide position botright
    let g:leaderGuide_vertical         = 0
    let g:leaderGuide_position         = 'botright'
    let g:leaderGuide_hspace           = 1
    let g:leaderGuide_run_map_on_popup = 0
endif

"}}}
