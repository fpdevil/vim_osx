"{{{
if has_key(g:plugs, 'fzf.vim')

    if has('nvim')
      let $FZF_DEFAULT_OPTS .= ' --inline-info'
      " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
    endif

    command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

  " Customize fzf colors to match your color scheme
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

    " nnoremap <silent> <Leader><Leader> :Files<CR>
    nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
    nnoremap <silent> <Leader>C        :Colors<CR>
    nnoremap <silent> <Leader><Enter>  :Buffers<CR>
    nnoremap <silent> <Leader>,f       :FufFileWithCurrentBufferDir<CR>
    nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
    nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
    xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
    nnoremap <silent> <Leader>`        :Marks<CR>
    " nnoremap <silent> q: :History:<CR>
    " nnoremap <silent> q/ :History/<CR>

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)

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

    command! PlugHelp call fzf#run(fzf#wrap({
      \ 'source':  sort(keys(g:plugs)),
      \ 'sink':    function('s:plugs_sink')}))

endif
"}}}
