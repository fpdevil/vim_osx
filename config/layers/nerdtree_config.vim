" ------------------------------------------------------------------------------------
" -----                       for NerdTree configuration                         -----
" ------------------------------------------------------------------------------------
"{{{ invoke by using the leader key map as - + nt
if has_key(g:plugs, 'nerdtree')
    augroup nerd_loader
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd BufEnter,BufNew *
            \  if isdirectory(expand('<amatch>'))
            \|   call plug#load('nerdtree')
            \|   execute 'autocmd! nerd_loader'
            \| endif
    augroup END

    nmap <leader>nt :NERDTreeToggle<CR>

    let NERDTreeHighlightCursorline   = 1            " highlight current cursor line
    let NERDTreeShowHidden            = 1            " show hidden files
    let g:NERDTreeChDirMode           = 1            " change to cwd
    let g:NERDTreeDirArrowExpandable  = ''          " horizontal arrow
    let g:NERDTreeDirArrowCollapsible = ''          " vertical arrow
endif
" }}}


"{{{ for NerdTree and Tabs

if has_key(g:plugs, 'vim-nerdtree-tabs')
    function! NERDTreeFileHighlight(extension, fg, bg, guifg, guibg)
        exec 'autocmd filetype nerdtree highlight ' . a:extension
                    \ .' ctermbg=' . a:bg . ' ctermfg='. a:fg
                    \ .' guibg='. a:guibg .' guifg='. a:guifg
        exec 'autocmd filetype nerdtree syn match ' . a:extension
                    \ .' #^\s\+.*'. a:extension .'$#'
    endfunction

    call NERDTreeFileHighlight('hrl', 'green', 'none', 'green', '#eee8d5')
    call NERDTreeFileHighlight('vim', 'LightYellow', 'LightRed', 'firebrick', 'grey')
    call NERDTreeFileHighlight('erl', 'LightRed', 'none', '#FA5882', '#eee8d5')
    call NERDTreeFileHighlight('ini', 'yellow', 'none', 'yellow', '#eee8d5')
    call NERDTreeFileHighlight('md', 'blue', 'none', '#3366FF', '#eee8d5')
    call NERDTreeFileHighlight('yml', 'LightMagenta', 'none', 'LightMagenta', '#eee8d5')
    call NERDTreeFileHighlight('sh', 'DarkYellow', 'none', 'DarkYellow', '#eee8d5')
    call NERDTreeFileHighlight('conf', 'yellow', 'none', 'yellow', '#eee8d5')
    call NERDTreeFileHighlight('json', 'yellow', 'none', 'yellow', '#eee8d5')
    call NERDTreeFileHighlight('html', 'yellow', 'none', 'yellow', '#eee8d5')
    call NERDTreeFileHighlight('css', 'cyan', 'none', 'cyan', '#eee8d5')
    call NERDTreeFileHighlight('coffee', 'Red', 'none', 'red', '#eee8d5')
    call NERDTreeFileHighlight('js', 'Red', 'none', '#ffa500', '#eee8d5')
    call NERDTreeFileHighlight('py', 'Magenta', 'none', '#FA8258', '#eee8d5')
    call NERDTreeFileHighlight('hs', 'none', 'lightgreen', 'white', 'lightgreen')
    call NERDTreeFileHighlight('xml', 'none', 'darkred', 'white', 'darkred')
endif
" }}}