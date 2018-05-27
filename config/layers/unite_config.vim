" ------------------------------------------------------------------------------------
" ------------------ VIM  File Management and Handling with Unite   ------------------
" ------------------------------------------------------------------------------------
scriptencoding utf-8

if isdirectory(expand("~/.vim/plugged/unite.vim/"))
    call unite#custom#source('codesearch', 'max_candidates', 30)
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#custom#profile('default', 'context',
                \ {
                \ 'safe': 0,
                \ 'start_insert': 1,
                \ 'ignorecase' : 1,
                \ 'short_source_names': 1,
                \ 'update_time': 200,
                \ 'direction': 'rightbelow',
                \ 'winwidth': 40,
                \ 'winheight': 15,
                \ 'max_candidates': 100,
                \ 'no_auto_resize': 1,
                \ 'vertical_preview': 1,
                \ 'cursor_line_time': '0.10',
                \ 'hide_icon': 0,
                \ 'candidate-icon': ' ',
                \ 'marked_icon': '✓',
                \ 'prompt' : '➭ '
                \ })
    call unite#custom#profile('source/neobundle/update', 'context',
                \ {
                \ 'start_insert' : 0,
                \ })

    let g:unite_source_codesearch_ignore_case    = 1
    let g:unite_source_buffer_time_format        = '(%m-%d-%Y %H:%M:%S) '
    let g:unite_source_file_mru_time_format      = '(%m-%d-%Y %H:%M:%S) '
    let g:unite_source_directory_mru_time_format = '(%m-%d-%Y %H:%M:%S) '
    let g:unite_source_directory_mru_limit       = 75
    let g:unite_source_file_rec_max_depth        = 6
    let g:unite_enable_ignore_case               = 1
    let g:unite_enable_smart_case                = 1
    let g:unite_data_directory                   = GetCacheDir('unite')
    let g:unite_winheight                        = 25
    let g:unite_source_history_yank_enable       = 1
    let g:unite_source_grep_default_opts         = '-iRHn'
                \ . " --exclude='tags'"
                \ . " --exclude='cscope*'"
                \ . " --exclude='*.svn*'"
                \ . " --exclude='*.log*'"
                \ . " --exclude='*tmp*'"
                \ . " --exclude-dir='**/tmp'"
                \ . " --exclude-dir='CVS'"
                \ . " --exclude-dir='.svn'"
                \ . " --exclude-dir='.git'"
                \ . " --exclude-dir='node_modules'"
    let g:unite_launch_apps = [
                \ 'rake',
                \ 'make',
                \ 'git pull',
                \ 'git push'
                \ ]
    let g:unite_source_menu_menus = {}

    if executable('ag')
        let g:unite_source_grep_command                      = 'ag'
        let g:unite_source_grep_recursive_opt                = ''
        let g:unite_source_rec_async_command                 =
                    \ ['ag', '--follow',
                    \  '--nocolor', '--nogroup',
                    \  '--hidden', '-g', '']
        let g:unite_source_grep_default_opts                 =
                    \'-i --vimgrep --hidden --ignore ' .
                    \ '''.hg'' --ignore ''.svn''
                    \ --ignore ''.git'' --ignore ''.bzr'''
    endif

    " for leader-map display
    let g:lmap = get(g:, 'lmap', {})

    " key mappings
    nnoremap <silent><leader>ufa :<C-u>Unite -no-split
                \ -buffer-name=Mixed -start-insert file file_mru file_rec buffer<cr>
    nnoremap <silent><leader>ufr :<C-u>Unite
                \ -buffer-name=files file_rec/async:!<cr>
    nnoremap <silent><leader>ufg :<C-u>Unite
                \ -buffer-name=git-repo file_rec/git<cr>
    call unite#custom#profile('file_rec/async,file_rec/git', 'context', {
                \ 'start_insert' : 1,
                \ 'quit'         : 1,
                \ 'split'        : 1,
                \ 'keep_focus'   : 1,
                \ 'winheight'    : 20,
                \ })
    call unite#custom#source('file_rec/async,file_rec/neovim', 'ignore_globs',
                \ ['*.png','.git/','*.ttf', '*.eot', '*.woff', '*.svg'])
    nnoremap <silent><leader>ufe  :<C-u>Unite
                \ -no-split -buffer-name=files -start-insert file<cr>
    nnoremap <silent><leader>ufE :<C-u>Unite
                \ -no-split -buffer-name=mru -start-insert file_mru<cr>
    nnoremap <silent><leader>ubb :<C-u>Unite
                \ -buffer-name=buffer  buffer<cr>
    nnoremap <silent><leader>ubB :<C-u>Unite
                \ -buffer-name=buffer_tab  buffer_tab<cr>
    call unite#custom#profile('buffer,buffer_tab', 'context', {
                \ 'start_insert' : 0,
                \ 'quit'         : 1,
                \ 'keep_focus'   : 1,
                \ })
    nnoremap <silent><leader>umM  :<C-u>Unite -start-insert mapping<CR>
    "" grep dictionay
    """ For searching the word in the cursor in the current directory
    nnoremap <silent><leader>uwd :Unite
                \ -auto-preview -no-split grep:.::<C-R><C-w><CR>
    """ For searching the word handin
    nnoremap <silent><leader>uws :Unite -auto-preview -no-split grep:.<CR>
    """ For searching the word in the cursor in the current buffer
    noremap <silent><leader>uwb :Unite
                \ -auto-preview -no-split grep:%::<C-r><C-w><CR>
    """ For searching the word in the cursor in all opened buffer
    noremap <silent><leader>uwB :Unite
                \ -auto-preview -no-split grep:$buffers::<C-r><C-w><CR>
    nnoremap <silent><Leader>ubl :<C-u>Unite
                \ -start-insert -buffer-name=buffer buffer<cr>
    nnoremap <silent><Leader>ubL :<C-u>Unite -start-insert -buffer-name=tag tag<cr>

    " recent files
    nnoremap <silent><leader>ufm :<C-u>Unite file_mru -default-action=split<Cr>
    nnoremap <silent><leader>ufb :<C-u>Unite buffer -default-action=split<Cr>
    nnoremap <silent><leader>ufB :<C-u>UniteWithBufferDir file_rec -default-action=split<Cr>

    nnoremap <silent><leader>ufo :<C-u>Unite outline -auto-preview -buffer-name=outline<Cr>
    nnoremap <silent><leader>ufl :<C-u>Unite file_rec/async<Cr>
    nnoremap <silent><leader>ufr :<C-u>Unite ref/man ref/hoogle ref/pydoc -default-action=split<Cr>

    " search for a string in multiple files or under a filetree
    nnoremap <silent><Leader>ufs :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>

    " search plugin
    " :Unite neobundle/search
    " for Unite menu
    nnoremap <silent><leader>umg :Unite -silent -start-insert menu:git<CR>
    nnoremap <silent><leader>uwf :UniteWithCursorWord file_rec/async<CR>
    nnoremap <silent><leader>uwt :UniteWithCursorWord tag<CR>

    " check color themes and airline themes
    "nnoremap <silent><leader>utc :<C-u>Unite colorscheme -auto-preview<CR>
    "nnoremap <silent><leader>uta :<C-u>Unite airline_themes -auto-preview<CR>

    " unite help
    " nnoremap <silent><leader>uh :Unite -start-insert help<CR>
   
    if has_key(g:lmap, 'u')
        let g:lmap.u.f = {
                    \ 'name': '+Files ',
                    \ 'a': ['Unite -no-split -buffer-name=Mixed -start-insert file file_mru file_rec buffer', 'Mixed search '],
                    \ 'R': ['Unite -buffer-name=files file_rec/async:!', 'Async buffer search '],
                    \ 'g': ['Unite -buffer-name=git-repo file_rec/git', 'Search GIT repo '],
                    \ 'f': ['Unite file', 'Browse for a file in current working dir '],
                    \ 'F': ['Unite -start-insert file', 'Browse for file in insert mode in cwd. '],
                    \ 'e': ['Unite -no-split -buffer-name=files -start-insert file', 'Browse files in insert mode '],
                    \ 'E': ['Unite -no-split -buffer-name=mru -start-insert file_mru', 'Browse recent files in insert mode '],
                    \ 'm': ['Unite file_mru -default-action=split', 'Get recent files list '],
                    \ 'b': ['Unite buffer -default-action=split', 'Browse list of currently open buffers '],
                    \ 'B': ['UniteWithBufferDir file_rec -default-action=split', 'Unite with buffers '],
                    \ 'o': ['Unite outline -auto-preview -buffer-name=outline', 'Get outline of current buffer '],
                    \ 'l': ['Unite file_rec/async', 'Recursive list of all files under cwd '],
                    \ 'r': ['Unite ref/man ref/hoogle ref/pydoc -default-action=split', 'Get doc references '],
                    \ 's': ['Unite -start-insert file_rec/async', 'Search for a string in multiple files '],
                    \ }

        let g:lmap.u.w = {
                    \ 'name': '+Word search ',
                    \ 'f': ['UniteWithCursorWord file_rec/async', 'Word under cursor in files '],
                    \ 't': ['UniteWithCursorWord tag', 'Word under cursor with tag '],
                    \ 'd': ['Unite -auto-preview -no-split grep:.::<C-R><C-w>', 'Search for word in cursor in cwd '],
                    \ 's': ['Unite -auto-preview -no-split grep:.', 'Search for a word '],
                    \ 'b': ['Unite -auto-preview -no-split grep:%::<C-r><C-w>', 'Search for word in current buffer '],
                    \ 'B': ['Unite -auto-preview -no-split grep:$buffers::<C-r><C-w>', 'Search for word in all open buffers '],
                    \ }

        let g:lmap.u.b = {
                    \ 'name': '+Buffers ',
                    \ 'l': ['Unite -start-insert -buffer-name=buffer buffer', 'Buffer list '],
                    \ 'L': ['Unite -start-insert -buffer-name=tag tag', 'Buffer list by tag '],
                    \ 'b': ['Unite -buffer-name=buffer  buffer', 'Browse buffers '],
                    \ 'B': ['Unite -buffer-name=buffer_tab  buffer_tab', 'Browse open buffers '],
                    \ }

        let g:lmap.u.h = {
                    \ 'name': '+Help ',
                    \ 'v': ['Unite -start-insert help', 'Unite get help on ViM objects '],
                    \ }

        let g:lmap.u.t = {
                    \ 'name': '+Themes ',
                    \ 'c': ['Unite colorscheme -auto-preview', 'Preview the color scheme '],
                    \ 'a': ['Unite airline_themes -auto-preview', 'Preview the airline theme '],
                    \ }

        let g:lmap.u.m = {
                    \ 'name': '+Show Unite Menu & Mappings ',
                    \ 'M': ['Unite -silent -start-insert menu', 'Unite Display all Menus'],
                    \ 'g': ['Unite -silent -start-insert menu:git', 'Unite GIT menu '],
                    \ 'v': ['Unite -silent -start-insert menu:vim', 'Unite ViM menu '],
                    \ 's': ['Unite -silent -start-insert menu:spelling', 'Unite Spell Checking menu '],
                    \ 'S': ['Unite -silent -start-insert menu:searching', 'Unite Search menu '],
                    \ 'p': ['Unite -silent -start-insert menu:python', 'Unite Python menu '],
                    \ 'h': ['Unite -silent -start-insert menu:http', 'Unite HTTP status codes menu '],
                    \ 'H': ['Unite -silent -start-insert menu:haskell', 'Unite Haskell menu '],
                    \ 'G': ['Unite -silent -start-insert menu:golang', 'Unite Golang menu '],
                    \ 'f': ['Unite -silent -start-insert menu:fzf', 'Unite FuzzyFinder menu '],
                    \ 'F': ['Unite -silent -start-insert menu:files', 'Unite Files menu '],
                    \ 'c': ['Unite -silent -start-insert menu:code', 'Unite Code menu '],
                    \ 'b': ['Unite -silent -start-insert menu:bookmarks', 'Unite Bookmarks menu '],
                    \ 'k': ['<C-u>Unite -start-insert mapping', 'Unite mappings '],
                    \ }
    endif


    augroup unite_buffer_feature
        autocmd FileType unite call s:unite_my_settings()
    augroup END
endif

function! s:unite_my_settings()
    " Overwrite settings.
    setlocal nowrap

    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-n>   <Plug>(unite_select_next_line)
    nmap <buffer> <C-n>   <Plug>(unite_select_next_line)
    imap <buffer> <C-p>   <Plug>(unite_select_previous_line)
    nmap <buffer> <C-p>   <Plug>(unite_select_previous_line)

    imap <buffer> jj      <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>   <Plug>(unite_delete_backward_path)
    imap <buffer> '       <Plug>(unite_quick_match_default_action)
    nmap <buffer> '       <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
                \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x         <Plug>(unite_quick_match_choose_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-e>     <Plug>(unite_toggle_auto_preview)
    imap <buffer> <C-e>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> l
                \ unite#smart_map('l', unite#do_action('default'))
    let unite = unite#get_current_unite()
    if unite.profile_name ==# 'search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
                \ empty(unite#mappings#get_current_filters()) ?
                \ ['sorter_reverse'] : [])

    " Runs "split" action by <C-s>.
    imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction



" -----------------------------------------------------------------------------
"  Source for unite.vim that shows outputs from quickfix (:Unite quickfix -wrap)
" -----------------------------------------------------------------------------
if has_key(g:plugs,'unite-quickfix')
    " multiline support
    let g:unite_quickfix_is_multiline=0
    call unite#custom_source('quickfix', 'converters', 'converter_quickfix_highlight')
    call unite#custom_source('location_list', 'converters', 'converter_quickfix_highlight')
endif

" -----------------------------------------------------------------------------
" vim unite exit on esc
" -----------------------------------------------------------------------------
function! s:UniteSettings()
    let b:actually_quit = 0
    setlocal updatetime=3
    au! InsertEnter <buffer> let b:actually_quit = 0
    au! InsertLeave <buffer> let b:actually_quit = 1
    au! CursorHold  <buffer> if exists('b:actually_quit') && b:actually_quit | close | endif
endfunction

au FileType unite call s:UniteSettings()



"== == == == == == == == == == == == == == == == == == == == == == == == == ==
" Unite Menu integration for all the unite commands
"== == == == == == == == == == == == == == == == == == == == == == == == == ==
let g:unite_source_menu_menus.files = {
            \ 'description' : '          files, dirs & ViM options
            \                             ⌘ [space]o',
            \ }
let g:unite_source_menu_menus.files.command_candidates = [
         \ ['▷ open file                                                  ⌘ <Leader>o',
         \ 'Unite -start-insert file'],
         \ ['▷ open more recently used files                              ⌘ <Leader>m',
         \ 'Unite file_mru'],
         \ ['▷ open file with recursive search                            ⌘ <Leader>O',
         \ 'Unite -start-insert file_rec/async'],
         \ ['▷ edit new file',
         \ 'Unite file/new'],
         \ ['▷ search directory',
         \ 'Unite directory'],
         \ ['▷ show outputs from quickfix',
         \ 'Unite quickfix -wrap'],
         \ ['▷ search recently used directories',
         \ 'Unite directory_mru'],
         \ ['▷ search directory with recursive search',
         \ 'Unite directory_rec/async'],
         \ ['▷ make new directory',
         \ 'Unite directory/new'],
         \ ['▷ change working directory',
         \ 'Unite -default-action=lcd directory'],
         \ ['▷ output ViM options',
         \ 'Unite options'],
         \ ['▷ know current working directory',
         \ 'Unite output:pwd'],
         \ ['▷ junk files                                                 ⌘ <Leader>d',
         \ 'Unite junkfile/new junkfile'],
         \ ['▷ save as root                                               ⌘ :w!!',
         \ 'exe "write !sudo tee % >/dev/null"'],
         \ ['▷ quick save                                                 ⌘ <Leader>w',
         \ 'normal <Leader>w'],
         \ ['▷ open ranger                                                ⌘ <Leader>x',
         \ 'call RangerChooser()'],
         \ ['▷ open vimfiler                                              ⌘ <Leader>X',
         \ 'VimFiler'],
         \ ]

let g:unite_source_menu_menus.files.command_candidates =
            \ custom_functions#unite_menu_gen(g:unite_source_menu_menus.files.command_candidates, [])

nnoremap <silent>[menu]o :Unite -silent -winheight=17 -start-insert
            \ menu:files<CR>

" vim:set et sw=4 sts=4 cc=79: