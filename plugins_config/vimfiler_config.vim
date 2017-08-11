scriptencoding utf-8
" configuration settings for VimFiler
" which is a File Explorer for vim
if has_key(g:plugs, 'vimfiler.vim')
    let g:vimfiler_as_default_explorer    = 1
    let g:vimfiler_restore_alternate_file = 1
    let g:vimfiler_tree_indentation       = 1
    let g:vimfiler_tree_leaf_icon         = ''
    let g:vimfiler_tree_opened_icon       = '▼'
    let g:vimfiler_tree_closed_icon       = '▷'
    let g:vimfiler_file_icon              = ''
    let g:vimfiler_readonly_file_icon     = '✗'
    let g:vimfiler_marked_file_icon       = '√'
    let g:vimfiler_direction              = 'rightbelow'
    "let g:vimfiler_preview_action        = 'auto_preview'
    let g:vimfiler_ignore_pattern         = [
          \ '^\.git$',
          \ '^\.DS_Store$',
          \ '^\.init\.vim-rplugin\~$',
          \ '^\.netrwhist$',
          \ '\.class$'
          \]
    
    if has('mac')
      let g:vimfiler_quick_look_command =
            \ '/Applications//Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
    else
      let g:vimfiler_quick_look_command = 'gloobus-preview'
    endif

    call vimfiler#custom#profile('default', 'context', {
          \ 'explorer' : 1,
          \ 'winwidth' : 30,
          \ 'winminwidth' : 30,
          \ 'toggle' : 1,
          \ 'auto_expand': 1,
          \ 'direction' : g:vimfiler_direction,
          \ 'parent': 0,
          \ 'status' : 1,
          \ 'safe' : 0,
          \ 'split' : 1,
          \ 'hidden': 1,
          \ 'no_quit' : 1,
          \ 'force_hide' : 0,
          \ })

endif
