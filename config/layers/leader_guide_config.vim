"{{{ for vim leader guide
if has_key(g:plugs, 'vim-leader-guide')
    let g:lmap        = {}
    let g:lmap.f      = { 'name' : 'File Menu' }
    let g:lmap.o      = { 'name' : 'Open Stuff' }
    let g:lmap.c      = { 'name' : 'Comments' }
    let g:lmap.c.c    = ['call feedkeys("\<Plug>NERDCommenterComment")','Comment']
    let g:lmap.c[' '] = ['call feedkeys("\<Plug>NERDCommenterToggle")','Toggle']
    let g:lmap.g      = {
                \ 'name' : 'Git Menu',
		\ 's'    : ['Gstatus', 'Git status'],
                \ 'p'    : ['Gpull',   'Git pull'],
                \ 'u'    : ['Gpush',   'Git push'],
                \ 'c'    : ['Gcommit', 'Git commit'],
                \ 'w'    : ['Gwrite',  'Git write'],
                \ 'l'    : ['Glog', 'Git log']
                \ }
    " provide commans and details of existing mappings
    nmap <silent> <leader>fd :e $MYVIMRC<CR>
    let g:lmap.f.d = ['e $MYVIMRC', 'Open vimrc']
    nmap <silent> <leader>fs :so %<CR>
    " let g:lmap.f.s = ['so %', 'Source file']
    nmap <silent> <leader>oo  :copen<CR>
    " let g:lmap.o.o = ['copen', 'Open quickfix']
    nmap <silent> <leader>ol  :lopen<CR>
    " let g:lmap.o.l = ['lopen', 'Open locationlist']
    nmap <silent> <leader>fw :w<CR>
    " let g:lmap.f.w = ['w', 'Write file']

    " for the guide pop up
    call leaderGuide#register_prefix_descriptions("-", "g:lmap")
    nnoremap <silent> <leader> :<c-u>LeaderGuide '-'<CR>
    vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '-'<CR>

    " Leaderguide position botright
    let g:leaderGuide_vertical = 1
    let g:leaderGuide_position = 'botright'
    let g:leaderGuide_hspace   = 5
endif

"}}}
