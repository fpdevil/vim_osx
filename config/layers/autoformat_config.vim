" ------------------------------------------------------------------------------------
" -----                         Auto formatting options                          -----
" ------------------------------------------------------------------------------------
if has_key(g:plugs,'vim-autoformat')
    nnoremap <silent> <Leader>fot :Autoformat<CR>
    let g:autoformat_verbosemode=1

    if !exists('g:formatter_yapf_style')
        let g:formatter_yapf_style = 'pep8'
    endif

    if !exists('g:formatdef_yapf')
        let g:formatdef_yapf = '"yapf --style=''{based_on_style:pep8,indent_width:".&shiftwidth."}'' -l ".a:firstline."-".a:lastline'
    endif

    if !exists('g:formatters_python')
        let g:formatters_python = ['yapf']
    endif
endif
