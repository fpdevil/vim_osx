" ------------------------------------------------------------------------------------
" -------           custom settings for the vim-startify plugin                -------
" ------------------------------------------------------------------------------------
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
let g:startify_bookmarks               = [ '~/.vim/vimrc', '~/.vim/bundled_plugins.vim', '~/aquamacs.d' ]
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
let g:startify_custom_footer           = 
            \ [''] 
            \ + map(split(system('date -R'), '\n'), '"   ". v:val') 
            \ + [''] 
            \ + map(split(system('lsb_release -a | tail -n 3'), '\n'), '"   ". v:val') 
            \ + ['']

" custom display colors
hi StartifyBracket ctermfg=240
hi StartifyFooter  ctermfg=111
hi StartifyHeader  ctermfg=203
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240

" show startify
autocmd User Startified AirlineRefresh
if has_key(g:plugs, 'vim-startify')
    try
        autocmd BufEnter * call StartifyConfig()     " call function from custom_functions.vim"
    catch
        echo "function cannot be executed until startify plugin is installed"
    endtry
endif

" vim:set et sw=2:
