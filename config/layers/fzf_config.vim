"{{{
if has_key(g:plugs, 'fzf.vim')
    " check if its neovim
    if has('gui_running')
        let $FZF_DEFAULT_OPTS .= ' --inline-info'
        " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
    endif

    " for terminal buffers, hide the statusline
    augroup fzf_vim
        autocmd! FileType fzf
        autocmd FileType fzf set laststatus=0 noshowmode noruler
                    \ autocmd BufLeave <buffer> set laststatus=2 showmode ruler

    " preview command
    command! -bang -nargs=? -complete=dir Files
                \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    " [[B]Commits] Customize the options used by 'git log':
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

    " customize tje FZF colors to match your color scheme
    let g:fzf_colors = {
                \ 'fg':      ['fg', 'Normal'],
                \ 'bg':      ['bg', 'Normal'],
                \ 'hl':      ['fg', 'Function'],
                \ 'fg+':     ['fg', 'String', 'CursorColumn', 'Normal'],
                \ 'bg+':     ['bg', 'Statusline', 'CursorColumn'],
                \ 'hl+':     ['fg', 'Type'],
                \ 'info':    ['fg', 'PreProc'],
                \ 'prompt':  ['fg', 'Conditional'],
                \ 'border':  ['fg', 'Ignore'],
                \ 'pointer': ['fg', 'Exception'],
                \ 'marker':  ['fg', 'String'],
                \ 'spinner': ['fg', 'Label'],
                \ 'header':  ['fg', 'Comment'],
                \   }

    " This is the default extra key bindings
    let g:fzf_action = {
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-x': 'split',
          \ 'ctrl-v': 'vsplit',
          \ }

    " helper function for getting the help for any installed plugin
    function! s:plugs_sink(line)
        let dir = g:plugs[a:line].dir
        for pat in ['doc/*.txt', 'README.md']
            let match = get(split(globpath(dir, pat), "\n"), 0, '')
            if len(match)
                execute 'tabedit' match
                return
            endif
        endfor
        tabnew
        execute 'Explore' dir
    endfunction

    " Get plugin help
    command! GetPlugHelp call fzf#run(fzf#wrap({
                \ 'source':  sort(keys(g:plugs)),
                \ 'sink':    function('s:plugs_sink')}))

    "nnoremap <silent> <Leader>,f       :FufFileWithCurrentBufferDir<CR>
    nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

    " for FuzzyFinder FZF
    let g:lmap = get(g:, 'lmap', {})
    let g:lmap.z = {
                \ 'name': '+Fuzzy Finder ',
                \ 'p' : ['GetPlugHelp', 'Get Help for listed Plugins '],
                \ 'f' : [':Files', 'Preview Files '],
                \ 'F' : [':Filetypes', 'Set File Type '],
                \ 'c' : [':Colors', 'List Color Schemes '],
                \ 'b' : [':Buffers', 'List Buffers '],
                \ 'B' : [':BLines', 'Lines in the current buffer'],
                \ 'd' : [':FufFileWithCurrentBufferDir', 'Find File under CurDir '],
                \ 'g' : [':GFiles?', 'Git files (git status) '],
                \ 'r' : [':Ag <C-R><C-W>', 'SilverSearch '],
                \ 'R' : [':Ag <C-R><C-A>', 'SilverSearcher '],
                \ 'o' : ['History', 'Open Buffers and v:oldfiles '],
                \ 'h' : ['History:', 'Cmd History '],
                \ 'H' : ['History/', 'Search History '],
                \ 'y' : [':Ag', 'SilverSearchAg '],
                \ 'm' : [':Marks', 'Marks '],
                \ 'w' : ['Windows', 'Windows '],
                \ 'k' : ['Maps', 'NormalMode KeyMappings '],
                \ 'K' : ['Commands', 'Commands Available '],
                \ 's' : ['Snippets', 'Snippets (UltiSnips) '],
                \ 't' : ['Commits', 'Git commits '],
                \ 'T' : ['BCommits', 'Git commits for current buffer '],
                \ }

    " nnoremap <silent> q: :History:<CR>
    " nnoremap <silent> q/ :History/<CR>

    " from the core fzf tool
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    "nmap <leader><tab> <plug>(fzf-maps-n)
    "xmap <leader><tab> <plug>(fzf-maps-x)
    "omap <leader><tab> <plug>(fzf-maps-o)

endif
"}}}

"== == == == == == == == == == == == == == == == == == == == == == == == == ==
"  Unite Menu integration for FuzzyFinder FzF
"== == == == == == == == == == == == == == == == == == == == == == == == == ==
let g:unite_source_menu_menus.fzf = {
            \ 'description' : '            FzF tools
            \                                             ⌘ [<leader>]z',
            \ }

let g:unite_source_menu_menus.fzf.command_candidates = [
            \ ['▷ Get Plugin Help                                   (fzf)           ⌘ <Leader>zp', 'GetPlugHelp'],
            \ ['▷ Preview Files                                     (fzf)           ⌘ <Leader>zf', 'Files'],
            \ ['▷ Set File Type for current buffer                  (fzf)           ⌘ <Leader>zF', 'Filetypes'],
            \ ['▷ List and select a color themes                    (fzf)           ⌘ <Leader>zc', 'Colors'],
            \ ['▷ List and select a buffer                          (fzf)           ⌘ <Leader>zb', 'Buffers'],
            \ ['▷ Git files (git status)                            (fzf)           ⌘ <Leader>zg', 'GFiles?'],
            \ ['▷ Get open buffers and v:oldfiles                   (fzf)           ⌘ <Leader>zo', 'History'],
            \ ['▷ Get Command History                               (fzf)           ⌘ <Leader>zH', 'History:'],
            \ ['▷ Get Search History                                (fzf)           ⌘ <Leader>zh', 'History/'],
            \ ['▷ Show Marks                                        (fzf)           ⌘ <Leader>zm', 'Marks'],
            \ ['▷ Show Windows                                      (fzf)           ⌘ <Leader>zw', 'Windows'],
            \ ['▷ Show Snippets (UltiSnips)                         (fzf)           ⌘ <Leader>zs', 'Snippets'],
            \ ['▷ Git Commits                                       (fzf)           ⌘ <Leader>zt', 'Commits'],
            \ ['▷ Git commits for the current buffer                (fzf)           ⌘ <Leader>zT', 'BCommits'],
            \ ]


"== == == == == == == == == == == == == == == == == == == == == == == == == ==
" unite menu integration for showing the grep options
"== == == == == == == == == == == == == == == == == == == == == == == == == ==
let g:unite_source_menu_menus.grep = {
      \ 'description' : '           search files
      \                                          ⌘ [space]a',
      \ }
let g:unite_source_menu_menus.grep.command_candidates = [
        \ ['▷ grep (ag → ack → grep)                                     ⌘ <Leader>a',
        \ 'Unite -auto-preview -winheight=40 -no-quit grep'],
        \ ['▷ grep current word                                          ⌘ <Leader>A',
        \ 'UniteWithCursorWord -auto-preview -winheight=40 -no-quit grep'],
        \ ['▷ find',
        \ 'Unite find'],
        \ ['▷ locate',
        \ 'Unite -start-insert locate'],
        \ ['▷ vimgrep (very slow)',
        \ 'Unite vimgrep'],
        \ ]

let g:unite_source_menu_menus.grep.command_candidates =
      \ custom_functions#unite_menu_gen(g:unite_source_menu_menus.grep.command_candidates, [])

nnoremap <silent>[menu]a :Unite -silent menu:grep<CR>

" vim:set et sw=4 sts=4 cc=79:
