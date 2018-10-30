" ------------------------------------------------------------------------------------
" ------                      Haskell ghc customization                         ------
" ------------------------------------------------------------------------------------


" === Haskell linting with ghcmod ===
"     first install with `cabal install ghcmod` if missing
"au FileType haskell let g:ghcmod_use_basedir = getcwd()  " resolve ghcmod base directory

" function for checking and linting at the same time
function! s:check_and_lint()
    let l:qflist = ghcmod#make('check', expand('%'))
    call extend(l:qflist, ghcmod#make('lint', expand('%')))
    call setqflist(l:qflist)
    cwindow
    if empty(l:qflist)
	echo 'No errors found'
    endif
endfunction

" when you write *.hs buffer to a file, both check and lint are run
"autocmd BufWritePost *.hs *.lhs call s:check_and_lint()


" for asynchronous checking
" this does both :GhcModCheck and :GhcModLint asynchronously
if !executable("ghcmod")
    "autocmd BufWritePost *.hs,*.lhs GhcModCheckAndLintAsync
    autocmd BufWritePost *.hs GhcModCheckAsync
endif

" show quickfix by ctrlp.vim
let g:ghcmod_open_quickfix_function = 'GhcModQuickFixByCtrlP'
function! GhcModQuickFixByCtrlP()
    CtrlPQuickfix
endfunction

" highlighting the mod type
hi ghcmodType ctermbg=yellow
let g:ghcmod_type_highlight = 'WildMenu'

" ------------------------------------------------------------------------------------
"  Fix path issues from vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" ------------------------------------------------------------------------------------
"let s:default_path = escape(&path, '\ ') " store default value of 'path'
" always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
"autocmd BufRead *
"	    \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
"	    \ exec "set path-=".s:tempPath |
"	    \ exec "set path-=".s:default_path |
"	    \ exec "set path^=".s:tempPath |
"	    \ exec "set path^=".s:default_path

" === hdevtools ===
" key-bindings for the haskell hdevtools type info 
au FileType haskell nnoremap <buffer>	       <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>


" === haskell highlighting ===
" vim-commentary and highlighting for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s
autocmd FileType haskell setlocal nospell
autocmd FileType haskell setlocal complete-=k	       " disable dictionary scan
autocmd FileType haskell setlocal complete-=i          " disable tag completion
autocmd FileType haskell setlocal complete-=t          " disable tag completion


" === haskell-vim customization ===
if has_key(g:plugs,'haskell-vim')
    let g:haskell_enable_quantification   = 1   " to enable highlighting of `forall`
    let g:haskell_enable_recursivedo      = 1   " to enable highlighting of `mdo` and `rec`
    let g:haskell_enable_arrowsyntax      = 1   " to enable highlighting of `proc`
    let g:haskell_enable_pattern_synonyms = 1   " to enable highlighting of `pattern`
    let g:haskell_enable_typeroles        = 1   " to enable highlighting of type roles
    let g:haskell_enable_static_pointers  = 1   " to enable highlighting of `static`
    let g:haskell_backpack                = 1   " to enable highlighting of backpack keywords
    let g:haskell_indent_case_alternative = 1
    let g:haskell_indent_if               = 4
    let g:haskell_indent_case             = 4
    let g:haskell_indent_let              = 4
    let g:haskell_indent_in               = 0
    let g:haskell_indent_where            = 2
    let g:haskell_indent_do               = 4
    let g:haskell_indent_guard            = 4

    let g:hs_highlight_delimiters	  = 1   " highlight delimiter characters
    let g:hs_highlight_boolean		  = 1   " treat True and False as keywords
    let g:hs_highlight_types		  = 1   " treat names of primitive types as keywords
    let g:hs_highlight_more_types	  = 1   " treat names of other common types as keywords
    let g:hs_highlight_debug		  = 1   " highlight names of debugging functions
endif


" === haskell symbol concealing ===
"    Haskell Concealing for pretty unicode haskell symbols
"    Use same color behind the concealed unicode characters
hi clear Conceal
let g:haskell_conceal_wide         = 1
let g:haskell_conceal_enumerations = 1
if has('gui_running')
    let hscoptions = '𝐒𝐓𝐄𝐌xRtB𝔻w'
endif


" === syntastic checker for haskell ===
" syntax checker(s) for haskell
if exists(':SyntasticInfo')
    let g:syntastic_haskell_checkers = ['hdevtools', 'hlint', 'ghc_mod']
    "let g:syntastic_mode_map={'mode': 'active', 'passive_filetypes': ['haskell']}
    "let g:syntastic_mode_map={'mode': 'active', 'active_filetypes': ["haskell"], 'passive_filetypes': []}
endif


" === hindent ===
if exists(':Hindent')
    let g:hindent_on_save     = 0
    let g:hindent_indent_size = 2
    let g:hindent_command     = '~/Library/Haskell/bin/hindent'
endif

" === neco-ghc (haskell auto-complete) ===
"let $PATH=$PATH.':'.expand("~/Library/Haskell/bin/")

"if exists(':NecoGhcDiagnostics')
if has_key(g:plugs,'neco-ghc')
    " disable haskell-vim omnifunc
    let g:haskellmode_completion_ghc = 1

    " set the appropriate omnifunc for auto-complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    "autocmd BufEnter *.hs,*.lhs setlocal omnifunc=necoghc#omnifunc

    " -- treat Frege files as haskell based
    autocmd BufEnter *.fr :filetype haskell

    " if necoghc_enable_detailed_browse = 1, it provides detailed info,
    " but if boot time is more disable it with the setting 0
    let g:necoghc_enable_detailed_browse  = 1
    let g:necoghc_debug                   = 0
    let g:necoghc_use_stack		  = 0
endif


" === support for pointfree styles ===
"   In visual mode you can now press gq to convert a expression to it’s
"   pointfree form.Though quite often the resulting form is more
"   obfuscated than the original.
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


" === refactoring ===
" Disable hlint-refactor-vim's default keybindings
let g:hlintRefactor#disableDefaultKeybindings = 1
" hlint-refactor-vim keybindings
map <silent> <leader>hr :call ApplyOneSuggestion()<CR>
map <silent> <leader>hR :call ApplyAllSuggestions()<CR>

" === stylish haskell (code formatter) ===
" vim stylish haskell integration
if has_key(g:plugs,'vim-stylish-haskell')
    let g:stylish_haskell_command='~/Library/Haskell/bin/stylish-haskell'
endif

" code formatter with Chiel92/vim-autoformat
" cuto format code on save using stylish-haskellaskell
" autocmd BufWrite *.hs :Autoformat

" === hindent (code formatter) ===
" Formatting - Use hindent instead of par for haskell buffers
autocmd FileType haskell let &formatprg="hindent --tab-size 2 -XQuasiQuotes"
" Enable some tabular presets for Haskell
let g:haskell_tabular = 1
if has_key(g:plugs,'vim-hindent')
    let g:hindent_on_save     = 0
    let g:hindent_line_length = 80
    let g:hindent_indent_size = 4
endif


" === hoogle (haskell search tool) ===
"   vim search hoogle web [Unite hoogle/web:map | Unite hoogle/web:\:\:a]
"if isdirectory(expand('~/.vim/plugged/vim-hoogle-web/'))
if has_key(g:plugs, 'vim-hoogle-web') && has_key(g:plugs, 'unite.vim')
    let g:hoogle#web#open_cmd = 'split'
    call unite#custom#default_action('source/hoogle_web/*' , 'open')
endif


" === tmux + ghci ===
"  ghci integration through tmux
"Function: RunGhci
"Desc: run a ghci repl through tmux
"
"Arguments: type
"
function! RunGhci(type)
    call VimuxRunCommand(' stack ghci && exit')
    if a:type
	call VimuxSendText(':l ' . bufname('%'))
	call VimuxSendKeys('Enter')
    endif
endfunction

if has_key(g:plugs,'vimux')
    augroup ghci
	au FileType haskell nmap <silent><buffer> <leader>hg :call RunGhci(1)<CR>
	au FileType haskell nmap <silent><buffer> <leader>hG :call RunGhci(0)<CR>
    augroup END
endif

" -----------------------------------------------------------------------------------
" vim key mapping with leader guide
" -----------------------------------------------------------------------------------
let g:lmap = get(g:, 'lmap', {})
let g:lmap.h = {
	    \ 'name' : '+Haskell GHC Menu ',
	    \ 't'    : [ 'GhcModType', 'Display type under cursor ' ],
	    \ 'e'    : [ 'GhcModTypeClear', 'Clear highlighting from GhcModType ' ],
	    \ 'p'    : [ 'GhcModInfoPreview', 'Show information about identifier in preview ' ],
	    \ 'T'    : [ 'GhcModTypeInsert', 'Insert type signature under cursor ' ],
	    \ 'd'    : [ 'GhcModDiagnostics', 'Show diagnostics report ' ],
	    \ 'f'    : [ 'Autoformat', 'Format code with stylish-haskell '],
	    \ 'c'    : [ 'SyntasticCheck ghc_mod', 'Syntax checking with ghc-mod ' ],
	    \ 'l'    : [ 'SyntasticCheck hlint', 'Syntax checking with hlint ' ],
	    \ 'h'    : [ 'Hoogle', 'Hoogle word under cursor ' ],
	    \ 'H'    : [ 'Hoogle', 'Hoogle and prompt for input ' ],
	    \ 'i'    : [ 'HoogleInfo', 'Get detailed documentation ' ],
	    \ 'I'    : [ 'HoogleInfo', 'Get detailed documentation and prompt for input ' ],
	    \ 'z'    : [ 'HoogleClose', 'Close the hoogle window ' ],
	    \ '.'    : [ 'call Pointfree()', 'Call for pointfree style ' ],
	    \ '>'    : [ 'call Pointful()', 'Call for pointful style ' ],
	    \ 'r'    : [ 'call ApplyOneSuggestion()', 'Apply a single suggestion from linter ' ],
	    \ 'R'    : [ 'call ApplyAllSuggestions()', 'Apply all suggestions from linter ' ],
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
	    \ ['▷ format code with stylish-haskell                  (stylish-hs)    ⌘ <Leader>hf', 'Autoformat'],
	    \ ]


" === tagbar plugin settings ===
" Tagbar plugin:
let g:tagbar_type_haskell = {
	    \ 'ctagsbin'  : 'hasktags',
	    \ 'ctagsargs' : '-x -c -o-',
	    \ 'kinds'     : [
	    \ 'm:modules:0:1',
	    \ 'd:data:0:1',
	    \ 'd_gadt:data gadt:0:1',
	    \ 'nt:newtype:0:1',
	    \ 'c:classes:0:1',
	    \ 'i:instances:0:1',
	    \ 'cons:constructors:0:1',
	    \ 'c_gadt:constructor gadt:0:1',
	    \ 'c_a:constructor accessors:1:1',
	    \ 't:type names:0:1',
	    \ 'pt:pattern types:0:1',
	    \ 'pi:pattern implementations:0:1',
	    \ 'ft:function types:0:1',
	    \ 'fi:function implementations:0:1',
	    \ 'o:others:0:1'
	    \ ],
	    \ 'sro'        : '.',
	    \ 'kind2scope' : {
	    \ 'm'      : 'module',
	    \ 'd'      : 'data',
	    \ 'd_gadt' : 'd_gadt',
	    \ 'c_gadt' : 'c_gadt',
	    \ 'nt'     : 'newtype',
	    \ 'cons'   : 'cons',
	    \ 'c_a'    : 'accessor',
	    \ 'c'      : 'class',
	    \ 'i'      : 'instance'
	    \ },
	    \ 'scope2kind' : {
	    \ 'module'   : 'm',
	    \ 'data'     : 'd',
	    \ 'newtype'  : 'nt',
	    \ 'cons'     : 'c_a',
	    \ 'd_gadt'   : 'c_gadt',
	    \ 'class'    : 'ft',
	    \ 'instance' : 'ft'
	    \ }
	    \ }
