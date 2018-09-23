" -----------------------------------------------------------------------------
"  neomru - recently used files and directories
" -----------------------------------------------------------------------------
"let s:cache_location = expand('~/.cache')
let s:cache_location = GetCacheDir('.')
let s:temp_file_pat = join([
            \ '/svn-commit\%(\.\d\+\)\?\.tmp$',
            \ '.git/COMMIT_EDITMSG$',
            \ '/bzr_log\..\{6}$',
            \ ], '\|')

if $TMP !=# ''
  let s:temp_file_pat .=
        \  '\|^' . substitute(expand($TMP), '\', '[/\\\\]', 'g')
elseif has('unix')
    let s:temp_file_pat .= '\|^/tmp/\|^/var/tmp/'
endif

if has_key(g:plugs,'neomru.vim')
    let g:neomru#file_mru_path           = s:cache_location . '/neomru/file'
    let g:neomru#directory_mru_path      = s:cache_location . '/neomru/directory'
    let g:neomru#filename_format         = ':~:.'
    let g:neomru#file_mru_limit          = 1000
    let g:neomru#file_mru_ignore_pattern = s:temp_file_pat
endif

" vim:set et ts=4 sts=4 sw=4 tw=0:
