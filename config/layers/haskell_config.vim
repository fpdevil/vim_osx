" ------------------------------------------------------------------------------------
" ------                      Haskell ghc customization                         ------
" ------------------------------------------------------------------------------------


" {{{ Haskell linting with ghcmod
" first install with `cabal install ghcmod` if missing
au FileType haskell let g:ghcmod_use_basedir = getcwd()  " resolve ghcmod base directory

" function for checking and linting at the same time
function! s:check_and_lint()
    let l:qflist = ghcmod#make('check', expand('%'))
    call extend(l:qflist, ghcmod#make('lint', expand('%')))
    call setqflist(l:qflist)
    cwindow
    if empty(l:qflist)
        echo "No errors found"
    endif
endfunction

" when you write *.hs buffer to a file, both check and lint are run
"autocmd BufWritePost *.hs *.lhs call s:check_and_lint()

" for asynchronous checking
autocmd BufWritePost *.hs,*.lhs GhcModCheckAndLintAsync

" highlighting the mod type
"hi ghcmodType ctermbg=blue
"let g:ghcmod_type_highlight = 'ghcmodType'
"}}}

" ------------------------------------------------------------------------------------
"  Fix path issues from vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" ------------------------------------------------------------------------------------
let s:default_path = escape(&path, '\ ') " store default value of 'path'
" always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
            \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
            \ exec "set path-=".s:tempPath |
            \ exec "set path-=".s:default_path |
            \ exec "set path^=".s:tempPath |
            \ exec "set path^=".s:default_path

" ------------------------------------------------------------------------------------
" key-bindings for the haskell hdevtools type info {{{
" ------------------------------------------------------------------------------------
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
" }}}

" ------------------------------------------------------------------------------------
" vim-commentary and highlighting for Haskell {{{
" ------------------------------------------------------------------------------------
autocmd FileType haskell setlocal commentstring=--\ %s
autocmd FileType haskell setlocal nospell
" }}}

" ------------------------------------------------------------------------------------
" for haskell-vim customization {{{
" ------------------------------------------------------------------------------------
if has_key(g:plugs,'haskell-vim')
    let g:haskell_enable_quantification   = 1   " to enable highlighting of `forall`
    let g:haskell_enable_recursivedo      = 1   " to enable highlighting of `mdo` and `rec`
    let g:haskell_enable_arrowsyntax      = 1   " to enable highlighting of `proc`
    let g:haskell_enable_pattern_synonyms = 1   " to enable highlighting of `pattern`
    let g:haskell_enable_typeroles        = 1   " to enable highlighting of type roles
    let g:haskell_enable_static_pointers  = 1   " to enable highlighting of `static`
    let g:haskell_backpack                = 1   " to enable highlighting of backpack keywords
    let g:haskell_indent_case_alternative = 1

    let hs_highlight_delimiters = 1             " highlight delimiter characters
    let hs_highlight_boolean    = 1             " treat True and False as keywords
    let hs_highlight_types      = 1             " treat names of primitive types as keywords
    let hs_highlight_more_types = 1             " treat names of other common types as keywords
    let hs_highlight_debug      = 1             " highlight names of debugging functions
endif
" }}}


" ------------------------------------------------------------------------------------
" Haskell Concealing for pretty unicode haskell symbols {{{
" ------------------------------------------------------------------------------------
"    Use same color behind the concealed unicode characters
hi clear Conceal
let g:haskell_conceal_wide         = 1
let g:haskell_conceal_enumerations = 1
if has('gui_running')
    let hscoptions = "𝐒𝐓𝐄𝐌xRtB𝔻w"
endif
" }}}

" ------------------------------------------------------------------------------------
" syntax checker(s) for haskell {{{
" ------------------------------------------------------------------------------------
if exists(':SyntasticInfo')
    let g:syntastic_haskell_checkers = ['hdevtools', 'hlint', 'ghc_mod']
    "let g:syntastic_mode_map={'mode': 'active', 'passive_filetypes': ['haskell']}
    "let g:syntastic_mode_map={'mode': 'active', 'active_filetypes': ["haskell"], 'passive_filetypes': []}
endif
"}}}


" ------------------------------------------------------------------------------------
" -----                     neco-ghc (haskell autocompleion)                     -----
" ------------------------------------------------------------------------------------
" let $PATH=$PATH.':'.expand("~/Library/Haskell/bin/")
" disablei/enable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 1

autocmd FileType haskell    setlocal omnifunc=necoghc#omnifunc
autocmd BufEnter *.hs,*.lhs setlocal omnifunc=necoghc#omnifunc

" if necoghc_enable_detailed_browse = 1, it provides detailed info,
" but if boot time is more disable it with the following
" let g:necoghc_enable_detailed_browse = 0
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_debug                  = 1

" -- treat Frege files as haskell based
autocmd BufEnter *.fr :filetype haskell

" Support for pointfree styles
" In visual mode you can now press gq to convert a expression to it’s
" pointfree form.Though quite often the resulting form is more
" obfuscated than the original.
autocmd BufEnter *.hs set formatprg=pointfree

" -----------------------------------------------------------------------------------
"  pointful conversion functions
" -----------------------------------------------------------------------------------
function! Pointfree()
    call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h. :call Pointfree()<CR>

function! Pointful()
    call setline('.', split(system('pointful '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h> :call Pointful()<CR>

" -----------------------------------------------------------------------------------
" Formatting - Use hindent instead of par for haskell buffers
" -----------------------------------------------------------------------------------
autocmd FileType haskell let &formatprg="hindent --tab-size 2 -XQuasiQuotes"

" Enable some tabular presets for Haskell
let g:haskell_tabular = 1

" -----------------------------------------------------------------------------------
" Disable hlint-refactor-vim's default keybindings
" -----------------------------------------------------------------------------------
let g:hlintRefactor#disableDefaultKeybindings = 1
" hlint-refactor-vim keybindings
map <silent> <leader>hr :call ApplyOneSuggestion()<CR>
map <silent> <leader>hR :call ApplyAllSuggestions()<CR>

" -----------------------------------------------------------------------------------
" vim stylish haskell integration
" -----------------------------------------------------------------------------------
"if has_key(g:plugs,'vim-stylish-haskell')
    "let g:stylish_haskell_command="~/Library/Haskell/bin/stylish-haskell"
"endif

" -----------------------------------------------------------------------------------
" vim key mapping with leader guide
" -----------------------------------------------------------------------------------
let g:lmap = get(g:, 'lmap', {})
let g:lmap.h = {
            \ 'name' : 'Haskell GHC Menu',
            \ 't'    : [ 'GhcModType', 'echo the type under cursor' ],
            \ 'e'    : [ 'GhcModTypeClear', 'clear highlight from GhcModType' ],
            \ 'p'    : [ 'GhcModInfoPreview', 'get the information about an identifier in preview' ],
            \ 'T'    : [ 'GhcModTypeInsert', 'insert a type signature under the cursor' ],
            \ 'd'    : [ 'GhcModDiagnostics', 'show diagnostics' ],
            \ 'c'    : [ 'SyntasticCheck ghc_mod', 'syntax checking with ghc-mod' ],
            \ 'l'    : [ 'SyntasticCheck hlint', 'syntax checking with hlint' ],
            \ 'h'    : [ 'Hoogle', 'do a hoogle search of word under cursor' ],
            \ 'H'    : [ 'Hoogle', 'hoogle and prompt for input' ],
            \ 'i'    : [ 'HoogleInfo', 'get detailed documentation using hoogle' ],
            \ 'I'    : [ 'HoogleInfo', 'hoogle detailed documentation and prompt for input' ],
            \ 'z'    : [ 'HoogleClose', 'close the hoogle window' ],
            \ '.'    : [ 'call Pointfree()', 'call for pointfree style' ],
            \ '>'    : [ 'call Pointful()', 'call for pointful style' ],
            \ 'r'    : [ 'call ApplyOneSuggestion()', 'apply a single suggestion from linter' ],
            \ 'R'    : [ 'call ApplyAllSuggestions()', 'apply all suggestions from linter' ],
            \ }

"== == == == == == == == == == == == == == == == == == == == == == == == == ==
"  Unite Menu for Haskell tools
"== == == == == == == == == == == == == == == == == == == == == == == == == ==
let g:unite_source_menu_menus.haskell = {
    \ 'description' : '        haskell tools
    \                                         ⌘ [space]h',
    \}

" push the candidates for commands
let g:unite_source_menu_menus.haskell.command_candidates = [
            \ ['▷ hoogle search of word under cursor                (hoogle)        ⌘ <Leader>hh', 'Hoogle'],
            \ ['▷ get detailed documentation                        (hoogle)        ⌘ <Leader>hi', 'HoogleInfo'],
            \ ['▷ close the hoogle window                           (hoogle)        ⌘ <Leader>hz', 'HoogleClose'],
            \ ['▷ syntax checking with ghc-mod                      (ghc-mod)       ⌘ <Leader>hc', 'SyntasticCheck ghc_mod'],
            \ ['▷ get information about an identifier in preview    (ghc-mod)       ⌘ <Leader>hp', 'GhcModInfoPreview'],
            \ ['▷ echo the type under cursor                        (ghc-mod)       ⌘ <Leader>ht', 'GhcModType'],
            \ ['▷ insert a type signature under the cursor          (ghc-mod)       ⌘ <Leader>hT', 'GhcModTypeInsert'],
            \ ['▷ show diagnostics                                  (ghc-mod)       ⌘ <Leader>hd', 'GhcModDiagnostics'],
            \ ['▷ clear highlight from GhcModType                   (ghc-mod)       ⌘ <Leader>he', 'GhcModTypeClear'],
            \ ['▷ syntax checking with hlint                        (hlint)         ⌘ <Leader>hl', 'SyntasticCheck hlint'],
            \ ]
