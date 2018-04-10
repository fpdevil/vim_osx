" configuration settings for vim-lookup
" Usage
" Use lookup#lookup() to jump to the defintion of the identifier under the cursor.
" Use lookup#pop() (or the default mapping <c-o>) to jump back.

"if has_key(g:plugs, 'vim-lookup')
if !empty(glob('~/.vim/plugged/vim-lookup'))
    autocmd FileType vim nnoremap <buffer><silent> <cr>  :call lookup#lookup()<cr>
endif


"== == == == == == == == == == == == == == == == == == == == == == == == == ==
" vim unite menu integration
"== == == == == == == == == == == == == == == == == == == == == == == == == ==
let g:unite_source_menu_menus.vim = {
            \ 'description' : '            vim
            \                                                   ⌘ [space]v',
            \ }

let g:unite_source_menu_menus.vim.command_candidates = [
            \ ['▷ choose colorscheme', 'Unite colorscheme -auto-preview'],
            \ ['▷ mappings', 'Unite mapping -start-insert'],
            \ ['▷ edit configuration file (vimrc)', 'edit $MYVIMRC'],
            \ ['▷ choose filetype', 'Unite -start-insert filetype'],
            \ ['▷ vim help', 'Unite -start-insert help'],
            \ ['▷ vim commands', 'Unite -start-insert command'],
            \ ['▷ vim functions', 'Unite -start-insert function'],
            \ ['▷ vim runtimepath', 'Unite -start-insert runtimepath'],
            \ ['▷ vim command output', 'Unite output'],
            \ ['▷ unite sources', 'Unite source'],
            \ ['▷ kill process', 'Unite -default-action=sigkill -start-insert process'],
            \ ['▷ launch executable (dmenu like)', 'Unite -start-insert launcher'],
            \ ]

let g:unite_source_menu_menus.vim.command_candidates =
            \ custom_functions#unite_menu_gen(g:unite_source_menu_menus.vim.command_candidates, [])

nnoremap <silent>[menu]v :Unite menu:vim -silent -start-insert<CR>
