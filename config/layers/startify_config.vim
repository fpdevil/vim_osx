" ------------------------------------------------------------------------------------
" -------           custom settings for the vim-startify plugin                -------
" ------------------------------------------------------------------------------------
" show startify
autocmd User Startified AirlineRefresh
"if has_key(g:plugs, 'vim-startify')
if !empty(glob('~/.vim/plugged/vim-startify'))
    try
        autocmd BufEnter * call StartifyConfig()     " call function from custom_functions.vim"
    catch
        echo "function cannot be executed until startify plugin is installed"
    endtry
endif

" custom display colors
hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

" for a custom header showing the node version
"let node = split('node ' . system('node -v'), '\n')
"let npm = split('npm ' . system('npm -v'), '\n')
"let g:startify_custom_header = map(node + npm, '"   ". v:val')

"let g:startify_custom_header          = startify#fortune#boxed()
let g:startify_fortune_use_unicode     = 0
let g:startify_session_dir             = $HOME .  '/.data/' . ( has('nvim') ? 'nvim' : 'vim' ) . '/session'
let g:startify_session_persistence     = 1
let g:startify_session_delete_buffers  = 1
let g:startify_change_to_vcs_root      = 1
let g:startify_change_to_dir           = 0
let g:startify_empty_buffer_key        = 'n'
let g:startify_relative_path           = 1
let g:startify_files_number            = 20
let g:startify_bookmarks               = [
            \ '~/.vim/vimrc',
            \ '~/.vim/config/plugins/bundled_plugins.vim',
            \ '~/.vim/config/plugins/plugin_settings.vim',
            \ '~/.vim/personal/personal_config.vim',
            \ '~/.emacs.d'
            \ ]
let g:startify_list_order              = [
            \ ['    My Sessions:'],
            \ 'sessions',
            \ ['    MRU files:'],
            \ 'files',
            \ ['    MRU files from Current Directory:'],
            \ 'dir',
            \ ['    My Bookmarks:'],
            \ 'bookmarks',
            \ ]
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
            \ 'bundle/.*/doc',
            \ ]
let g:startify_custom_footer =
            \ ['']
            \ + map(split(system('date -R'), '\n'), '"   ". v:val')
            \ + ['']
            \ + map(split(system('lsb_release -a | tail -n 3'), '\n'), '"   ". v:val')
            \ + ['']

" vim:set et sw=4:
