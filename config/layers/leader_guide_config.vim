"{{{ for vim leader guide
if isdirectory(expand("~/.vim/plugged/vim-leader-guide/"))
    let g:lmap        = {}
    let g:lmap.f      = { 'name' : 'File Menu' }
    let g:lmap.o      = { 'name' : 'Open Stuff' }
    let g:lmap.c      = { 'name' : 'Comments' }
    let g:lmap.u      = { 'name' : 'Unite Family' }
    let g:lmap.c.c    = ['call feedkeys("\<Plug>NERDCommenterComment")','Comment']
    let g:lmap.c[' '] = ['call feedkeys("\<Plug>NERDCommenterToggle")','Toggle']

    " provide commans and details of existing mappings
    nmap <silent> <leader>fd :e $MYVIMRC<CR>
    let g:lmap.f.d = ['e $MYVIMRC', 'Open vimrc']
    nmap <silent> <leader>fs :so %<CR>
    " let g:lmap.f.s = ['so %', 'Source file']
    nmap <silent> <leader>oo  :copen<CR>
    let g:lmap.o.o = ['copen', 'Open quickfix']
    nmap <silent> <leader>ol  :lopen<CR>
    let g:lmap.o.l = ['lopen', 'Open locationlist']
    nmap <silent> <leader>fw :w<CR>
    let g:lmap.f.w = ['w', 'Write file']

    " for miscelleaneous tools
    let g:lmap.m = {
                \ 'name': "Misc Tools",
                \ }

    " for files
    let g:lmap.m.f = {
                \ 'name' : 'File Tools',
                \ }

    " for FuzzyFinder FZF
    let g:lmap.z = {
                \ 'name': 'Fuzzy Finder',
                \ 'f' : [':Files', 'Preview Files'],
                \ 'c' : [':Colors', 'List Color Schemes'],
                \ 'b' : [':Buffers', 'List Buffers'],
                \ 'd' : [':FufFileWithCurrentBufferDir', 'Find File under CurDir'],
                \ 'g' : [':Ag <C-R><C-W>', 'SilverSearch'],
                \ 'G' : [':Ag <C-R><C-A>', 'SilverSearcher'],
                \ 'y' : ['y:Ag <C-R>"', 'SilverSearchAg'],
                \ 'm' : [':Marks', 'Marks'],
                \ 'w' : ['Windows', 'Windows'],
                \ 'k' : ['Maps', 'NormalMode KeyMappings'],
                \ 's' : ['Snippets', 'ShowSnippets'],
                \ 't' : ['Commits', 'ShowCommits'],
                \ }


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
