if has_key(g:plugs,'denite.nvim')
    " Add custom menus
    let s:menus = {}
    let s:menus.file = {'description': 'File search (buffer, file, file_rec, file_mru'}
    let s:menus.line = {'description': 'Line search (change, grep, line, tag'}
    let s:menus.others = {'description': 'Others (command, command_history, help)'}
    let s:menus.file.command_candidates = [
                \ ['buffer', 'Denite buffer'],
                \ ['file: Files in the current directory', 'Denite file'],
                \ ['file_rec: Files, recursive list under the current directory', 'Denite file_rec'],
                \ ['file_mru: Most recently used files', 'Denite file_mru']
                \ ]
    let s:menus.line.command_candidates = [
                \ ['change', 'Denite change'],
                \ ['grep :grep', 'Denite grep'],
                \ ['line', 'Denite line'],
                \ ['tag', 'Denite tag']
                \ ]
    let s:menus.others.command_candidates = [
                \ ['command', 'Denite command'],
                \ ['command_history', 'Denite command_history'],
                \ ['help', 'Denite help']
                \ ]

    call denite#custom#var('menu', 'menus', s:menus)


    call denite#custom#var('file_rec', 'command',
                \ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''])
    " Ag command on grep source
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts',
                \ ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'default_opts', [])
    call denite#custom#var('grep', 'recursive_opts', [])
 
    call denite#custom#option('default', 'prompt', '>')


    " customize ignore globs
    call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy','matcher_ignore_globs'])
    call denite#custom#source('directory_rec', 'matchers', ['matcher_fuzzy','matcher_ignore_globs'])
    call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
                \ [
                \ '.git/', 'build/', '__pycache__/',
                \ 'images/', '*.o', '*.make',
                \ '*.min.*',
                \ 'img/', 'fonts/'])

    " Change sorters.
    " Uses the scoring algorithm from this article and its implementation:
    call denite#custom#source(
                \ 'file_rec', 'sorters', ['sorter/sublime'])


    "nnoremap [denite] <Nop>
    "nmap <Leader>d [denite]
    "nnoremap <silent> [denite]b :Denite buffer<CR>
    "nnoremap <silent> [denite]c :Denite changes<CR>
    "nnoremap <silent> [denite]f :Denite file<CR>
    "nnoremap <silent> [denite]g :Denite grep<CR>
    "nnoremap <silent> [denite]h :Denite help<CR>
    "nnoremap <silent> [denite]h :Denite help<CR>
    "nnoremap <silent> [denite]l :Denite line<CR>
    "nnoremap <silent> [denite]t :Denite tag<CR>
    "nnoremap <silent> [denite]m :Denite file_mru<CR>
    "nnoremap <silent> [denite]u :Denite menu<CR>

    let g:lmap = get(g:, 'lmap', {})
    let g:lmap.d = {
                \ 'name': '+Denite',
                \ 'b': ['Denite buffer', 'Browse list of currently open buffers'],
                \ 'c': ['Denite changes', 'Get list of changes'],
                \ 'f': ['Denite file/rec', 'Browse recursively list of all files (cwd)'],
                \ 'h': ['Denite help', 'Get help on selected item'],
                \ 'l': ['Denite line', 'Search for a word and get lines'],
                \ 't': ['Denite tag', 'Lookup Tags'],
                \ 'm': ['Denite file_mru', 'Get list of recently opened files'],
                \ 'u': ['Denite menu', 'Get Denite Menu'],
                \}

    call denite#custom#map(
                \ 'insert',
                \ '<Down>',
                \ '<denite:move_to_next_line>',
                \ 'noremap'
                \)
    call denite#custom#map(
                \ 'insert',
                \ '<Up>',
                \ '<denite:move_to_previous_line>',
                \ 'noremap'
                \)
    call denite#custom#map(
                \ 'insert',
                \ '<C-N>',
                \ '<denite:move_to_next_line>',
                \ 'noremap'
                \)
    call denite#custom#map(
                \ 'insert',
                \ '<C-P>',
                \ '<denite:move_to_previous_line>',
                \ 'noremap'
                \)
    call denite#custom#map(
                \ 'insert',
                \ '<C-G>',
                \ '<denite:assign_next_txt>',
                \ 'noremap'
                \)
    call denite#custom#map(
                \ 'insert',
                \ '<C-T>',
                \ '<denite:assign_previous_line>',
                \ 'noremap'
                \)
    call denite#custom#map(
                \ 'normal',
                \ '/',
                \ '<denite:enter_mode:insert>',
                \ 'noremap'
                \)
    call denite#custom#map(
                \ 'insert',
                \ '<Esc>',
                \ '<denite:enter_mode:normal>',
                \ 'noremap'
                \)
endif
