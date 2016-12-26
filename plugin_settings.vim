" ####################################################################################
" ################### VIM - Plugin Configuration and Customization ###################
" ####################################################################################

" ------------------------------------------------------------------------------------
" -----                         Auto formatting options                          -----
" ------------------------------------------------------------------------------------
nnoremap <silent> <Leader>f :Autoformat<CR>
if !exists('g:formatter_yapf_style')
    let g:formatter_yapf_style = 'pep8'
endif
if !exists('g:formatdef_yapf')
    let g:formatdef_yapf = "'yapf --style=\"{based_on_style:'.g:formatter_yapf_style.',indent_width:'.&shiftwidth.',column_limit:'.&textwidth.'}\" -l '.a:firstline.'-'.a:lastline"
endif
if !exists('g:formatters_python')
    let g:formatters_python = ['yapf']
endif


" ------------------------------------------------------------------------------------
" ------                     NerdCommenter customizations                       ------
" ------------------------------------------------------------------------------------
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines      = 1
" Enable trimming of trailing whitespace when un-commenting
let g:NERDTrimTrailingWhitespace = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims            = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs        = 1


" ------------------------------------------------------------------------------------
" ------           SuperTab TAB Completions and Color Customizations            ------
" ------------------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
" for working in tandem with OmniCompletion
let g:SuperTabDefaultCompletionType = 'context'

" set the colorscheme to solarized light if running macvim in gui
if has("gui_running")
    colorscheme solarized
    let g:airline_theme = 'cool'
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
    if has("unix")
        inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
    endif
endif


" ------------------------------------------------------------------------------------
" ------              key bindings for UltiSnipsExpandTrigger                   ------
" ------------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" select the directory location for common snippets
let g:UltiSnipsSnippetsDir       = $HOME . '/.vim/snippets'


" ------------------------------------------------------------------------------------
" ------                      Haskell ghc customization                         ------
" ------------------------------------------------------------------------------------
" normal mode key mappings (ex: press -ht)
" **** ghc-mod shortcuts ****
nmap <silent> <leader>ht :GhcModType<CR>
nmap <silent> <leader>he :GhcModTypeClear<CR>
nmap <silent> <leader>hi :GhcModTypeInsert<CR>
nmap <silent> <leader>hs :GhcModSplitFunCase<CR>
nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>:lopen<CR>
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>:lopen<CR>


" ****  hoogle shortcuts ****
nnoremap <silent> <leader>hh :Hoogle<CR>        " Hoogle the word under the cursor
nnoremap <leader>hH :Hoogle                     " Hoogle and prompt for input
nnoremap <silent> <leader>hi :HoogleInfo<CR>    " Hoogle for detailed documentation (e.g. "Functor")
nnoremap <leader>hI :HoogleInfo                 " Hoogle for detailed documentation and prompt for input
nnoremap <silent> <leader>hz :HoogleClose<CR>   " Hoogle, close the Hoogle window


" **** syntax checking for haskell ****
" let g:syntastic_mode_map={'mode': 'active', 'passive_filetypes': ['haskell']}
let g:syntastic_mode_map={'mode': 'active',
                        \ 'active_filetypes': ['haskell', 'python', 'cpp'],
                        \ 'passive_filetypes': []}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 0
" for skipping syntax the checking while exiting vim using :wq
let g:syntastic_check_on_wq              = 0

" auto-checking on writing
autocmd BufWritePost *.hs,*.lhs GhcModCheckAndLintAsync

" key-bindings for the haskell hdevtools type info
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" ------------------------------------------------------------------------------------
" ----------                 for haskell-vim customization                  ----------
" ------------------------------------------------------------------------------------
let g:haskell_enable_quantification   = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1   " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1   " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1   " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1   " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1   " to enable highlighting of `static`


" ------------------------------------------------------------------------------------
" ---------               Pretty unicode haskell symbols                     ---------
" ------------------------------------------------------------------------------------
let g:haskell_conceal_wide         = 1
let g:haskell_conceal_enumerations = 1
let hscoptions                     = "𝐒𝐓𝐄𝐌xRtB𝔻w"

" ------------------------------------------------------------------------------------
" -----                       for NerdTree configuration                         -----
" ----- invoke by using the leader key map as - + nt                             -----
" ------------------------------------------------------------------------------------
nmap <leader>nt :NERDTreeToggle<CR>

let NERDTreeHighlightCursorline   = 1            " highlight current cursor line
let NERDTreeShowHidden            = 1            " show hidden files
let g:NERDTreeDirArrowExpandable  = '▸'          " horizontal arrow
let g:NERDTreeDirArrowCollapsible = '▾'          " vertical arrow


" ------------------------------------------------------------------------------------
" -----                      for tab alignment configuration                     -----
" ------------------------------------------------------------------------------------
let g:haskell_tabular = 1
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /<-<CR>


" ------------------------------------------------------------------------------------
" -----                     neco-ghc (haskell autocompleion)                     -----
" ------------------------------------------------------------------------------------
let $PATH=$PATH.':'.expand("~/Library/Haskell/bin/")
" Disable haskell-vim omnifunc
" let g:haskellmode_completion_ghc = 0
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd BufEnter *.hs,*.lhs setlocal omnifunc=necoghc#omnifunc
" if necoghc_enable_detailed_browse = 1, it provides detailed info,
" but if boot time is more disable it necoghc_enable_detailed_browse = 0
let g:necoghc_enable_detailed_browse = 1

"
" -- treat Frege files as haskell based
autocmd BufEnter *.fr :filetype haskell


" ------------------------------------------------------------------------------------
" ----------    Next generation completion framework after NeoComplcache    ----------
" ----------            NeoComplcache (advanced auto completion)            ----------
" ----------       using neocomplete instead of the neocomplete cache       ----------
" ------------------------------------------------------------------------------------
"let g:acp_enableAtStartup                          = 0             " for disabling the AutoComplPop
let g:neocomplete#enable_at_startup                 = 1             " use neocomplete at startup
let g:neocomplete#enable_smart_case                 = 1             " use smart-case
let g:neocomplete#sources#syntax#min_keyword_length = 2             " set minimum syntax keyword length
let g:neocomplete#lock_buffer_name_pattern          = '\*ku\*'      " regex for buffer name
" define a dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default'     : '',
    \ 'vimshell'    : $HOME . '/.vim/dict/.vimshell_hist',
    \ 'scheme'      : $HOME . '/.vim/dict/.gosh_completions',
    \ 'erlang'      : $HOME . '/.vim/dict/erlang.dict',
    \ 'javascript'  : $HOME . '/.vim/dict/javascript.dict',
    \ 'scala'       : $HOME . '/.vim/dict/scala.dict',
    \ 'int-erl'     : $HOME . '/.vim/dict/erlang.dict',
    \ 'objc'        : $HOME . '/.vim/dict/objc.dict'
    \ }


if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes.c          = 'ref-man,ref-erlang'
let g:neocomplete#same_filetypes.ruby       = 'ref-refe'
let g:neocomplete#same_filetypes.erlang     = 'ref-erlang'
let g:neocomplete#same_filetypes.objc       = 'c'
let g:neocomplete#same_filetypes['int-erl'] = 'erlang,ref-erlang'

" define the keyword patterns
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" plugin key mappings for NeoComplete
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" settings for enabling the OmniCompletion for various languages
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#CompleteCpp
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType python setlocal omnifunc=python3complete#Complete
if has('python3')
    autocmd FileType python setlocal omnifunc=python3complete#Complete
else
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
endif

autocmd BufRead,BufNewFile *.go set filetype=go


" ************************************************************************************
" ////////////////////////////////// COMMENTED OUT ///////////////////////////////////
" ------------------- below section commented in favour of neocomplete ---------------
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'.ghosh_completions'
"    \ }
"inoremap <expr><C-g> neocomplcache#undo_completion()
"inoremap <expr><C-l> neocomplcache#complete_common_string()
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"    return neocomplcache#smart_close_popup() . "\<CR>"
"endfunction
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"function! SetToCabalBuild()
"    if glob("*.cabal") != ''
"        set makeprg=cabal\ build
"    endif
"endfunction
"autocmd BufEnter *.hs,*.lhs :call SetToCabalBuild()
" ************************************************************************************

" ------------------------------------------------------------------------------------
" ---------              CtrlSpace customization settings                    ---------
" ---------  getting help with the below options                             ---------
" ---------  :help g:CtrlSpaceSymbols                                        ---------
" ------------------------------------------------------------------------------------
if has("gui_running")
    " Settings for vim and monaco powerline font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif


" ------------------------------------------------------------------------------------
" -----------                    CtrlP customized bindings                 -----------
" ------------------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" ------------------------------------------------------------------------------------
" ---------------------- custom settings for the vim git gutter ----------------------
" ------------------------------------------------------------------------------------
highlight clear SignColumn
highlight SignColumn ctermbg=0
nmap gn <Plug>GitGutterNextHunk
nmap gN <Plug>GitGutterPrevHunk
let g:gitgutter_realtime = 0


" ------------------------------------------------------------------------------------
" ------------------ VIM  File Management and Handling with Plugins ------------------
" ------------------------------------------------------------------------------------
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
nnoremap <space>f :split<cr> :<C-u>Unite file<cr>
nnoremap <space>g :split<cr> :<C-u>Unite -start-insert file_rec/git<cr>
" make a grep on all files!
nnoremap <space>/ :split<cr> :<C-u>Unite grep:.<cr>
" see the yank history
nnoremap <space>y :split<cr>:<C-u>Unite history/yank<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)


" ------------------------------------------------------------------------------------
" ------------- Clojure language customization with rainbow parenthesis  -------------
" ------------------------------------------------------------------------------------
" Clojure
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesActivate
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadRound
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadSquare
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadBraces
" Fix I don't know why
autocmd BufEnter *.cljs,*.clj,*.cljs.hl setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:

" .ymd file type handling
autocmd BufEnter *.ymd set filetype=markdown
autocmd BufEnter *.cljs,*.cljs.hl set filetype=clojure
"  Reload the browser on cljs save
"  don't forget to put <script src="http://localhost:9001/ws"></script>
"  in your HTML
"  au BufWritePost *.cljs :BCReloadPage

" ------------------------------------------------------------------------------------
" ------ customizing the rainbow parenthesis with choice of colors upto depth 9 ------
" ------------------------------------------------------------------------------------
let g:rbpt_colorpairs = [
	\ ['darkyellow',  'RoyalBlue3'],
	\ ['darkgreen',   'SeaGreen3'],
	\ ['darkcyan',    'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['DarkMagenta', 'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkyellow',  'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['DarkMagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkyellow',  'DarkOrchid3'],
	\ ['darkred',     'firebrick3'],
	\ ]

" Rainbow Always On
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" ####################################################################################
" ############################## Personal Configuration ##############################
" ####################################################################################
" Using the powerline fonts for airline to display the glyphs
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif


" fonts and vim powerline symbols to be shown in the statusbar
set guifont=Monaco\ for\ Powerline:h12

let g:airline_powerline_fonts                   = 1
let g:airline_symbols.space                     = "\ua0"
let g:Powerline_symbols                         = 'fancy'
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#fnamemod       = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_y                         = 'BN: %{bufnr("%")}'
let g:airline_detect_paste                      = 1                     " show PASTE in paste mode
let g:airline#extensions#hunks#non_zero_only    = 1                     " remove extra space with +/-/~ of 0


" ------------------------------------------------------------------------------------
" /////////////  FANCY abcdefgh in status bar (copied from airline blog) ////////////
" ------------------------------------------------------------------------------------
function! AccentDemo()
  let keys = ['a','b','c','d','e','f','g','h']
  for k in keys
    call airline#parts#define_text(k, k)
  endfor
  call airline#parts#define_accent('a', 'red')
  call airline#parts#define_accent('b', 'green')
  call airline#parts#define_accent('c', 'blue')
  call airline#parts#define_accent('d', 'yellow')
  call airline#parts#define_accent('e', 'orange')
  call airline#parts#define_accent('f', 'purple')
  call airline#parts#define_accent('g', 'bold')
  call airline#parts#define_accent('h', 'italic')
  let g:airline_section_a = airline#section#create(keys)
endfunction
autocmd VimEnter * call AccentDemo()

" Airline Modeline display Info and Eye Candy (custom symbols)
" git gutter show
" personal appearance options
" let g:airline_left_sep                        = '['
" let g:airline_right_sep                       = ']'
let g:airline#extensions#hunks#enabled          = 1
let g:airline_linecolumn_prefix                 = '§'
let g:airline_paste_symbol                      = 'Þ'
let g:airline_readonly_symbol                   = 'Ʀ'
let g:airline_enable_branch                     = 1
let g:airline#extensions#syntastic#enabled      = 1
" deprecated option
" let g:airline_enable_syntastic                = 0


" ------------------------------------------------------------------------------------
" --------------------- Alignment Helper, Easy align interactive ---------------------
" ------------------------------------------------------------------------------------
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '\': { 'pattern': '\\' },
\ '/': { 'pattern': '//\+\|/\*\|\*/', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] },
\ ']': {
\     'pattern':       '\]\zs',
\     'left_margin':   0,
\     'right_margin':  1,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       ')\zs',
\     'left_margin':   0,
\     'right_margin':  1,
\     'stick_to_left': 0
\   },
\ 'f': {
\     'pattern': ' \(\S\+(\)\@=',
\     'left_margin': 0,
\     'right_margin': 0
\   },
\ 'd': {
\     'pattern': ' \ze\S\+\s*[;=]',
\     'left_margin': 0,
\     'right_margin': 0
\   }
\ }

vnoremap <silent> <Enter> :EasyAlign<cr>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a vim motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" --- type ° to search the word in all files in the current dir (Silver search)
nmap ° :Ag <c-r>=expand("<cword>")<cr><cr>


" ------------------------------- vim-pandoc  folding -------------------------------
let g:pandoc#modules#disabled = ["folding"]


" ------------------------------------------------------------------------------------
" --------                      Slime configuration                          ---------
" ------------------------------------------------------------------------------------
vmap <silent> <Leader>rs <Plug>SendSelectionToTmux
nmap <silent> <Leader>rs <Plug>NormalModeSendToTmux
nmap <silent> <Leader>rv <Plug>SetTmuxVars


" ------------------------------------------------------------------------------------
" -----                  terminal multiplex (TMUX) configuration                  ---
" ------------------------------------------------------------------------------------
" Manually create key mappings (to avoid rebinding C-\)
let g:tmux_navigator_no_mappings = 1
let g:slime_target               = "tmux"
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Support for pointfree styles
" In visual mode you can now press gq to convert a expression to it’s
" pointfree form.Though quite often the resulting form is more
" obfuscated than the original.
autocmd BufEnter *.hs set formatprg=pointfree


" ------------------------------------------------------------------------------------
" ------------------------------------ for erlang ------------------------------------
" ------------------------------------------------------------------------------------
" for erlang development - syntax checking through syntaxerl
let g:syntastic_erlang_checkers   = ['syntaxerl']
let g:syntastic_erlc_include_path = "ebin"
let g:erlangManPath               = '/usr/local/opt/erlang/lib/erlang/man' " erlang man pages


" ------------------------------------------------------------------------------------
" -------                Personal settings for Syntastic Checker               -------
" ------- By default, Syntastic uses arrow symbols to indicate line with error -------
" ------- To spice things up, you can specify any Unicode symbol as that error -------
" ------------------------------------------------------------------------------------
" getbg function
" gets the background of a highlighting group with fallback to SignColumn group
function! s:getbg(group)
    if has("gui_running")
        let l:mode       = 'gui'
        let l:validation = '\w\+\|#\x\+'
    else
        let l:mode       = 'cterm'
        let l:validation = '\w\+'
    endif

    if synIDattr(synIDtrans(hlID(a:group)), 'reverse', l:mode)
        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'fg', l:mode)
    else
        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'bg', l:mode)
    endif

    if l:bg == '-1' || l:bg !~ l:validation
        if synIDattr(synIDtrans(hlID('SignColumn')), 'reverse', l:mode)
            let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'fg', l:mode)
        else
            let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', l:mode)
        endif
    endif

    if l:bg == '-1' || l:bg !~ l:validation
        return ''
    endif

    return l:mode . 'bg=' . l:bg
endfunction


" syntastic checker to display error and warning symbols
let g:syntastic_error_symbol         = '✗'
let g:syntastic_warning_symbol       = '⚠'
let g:syntastic_style_error_symbol   = '✍'
let g:syntastic_style_warning_symbol = '✍'
hi! link SyntasticErrorLine Visual
hi! link SyntasticWarningLine Visual
au VimEnter,ColorScheme * exec 'hi! SyntasticErrorSign guifg=red ctermfg=red ' . s:getbg('SyntasticErrorLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticWarningSign guifg=yellow ctermfg=yellow ' . s:getbg('SyntasticWarningLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticError ' . s:getbg('SyntasticErrorLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticWarning ' . s:getbg('SyntasticWarningLine')


" ------------------------------------------------------------------------------------
" ---------    python/python3 and JEDI syntastic integration for checking    ---------
" ----- ycm can also be used,  but pretty happy with the JEDI completion for now -----
" ------------------------------------------------------------------------------------
" jedi auto-completion and syntax checking for python3
" the below section first does a check on which version of python to choose
if has('python')
  let g:jedi#force_py_version        = 2
  let g:syntastic_python_python_exec = 'python'
  let g:pymode_python                = 'python'
elseif has('python3')
  let g:jedi#force_py_version        = 3
  let g:syntastic_python_python_exec = '/usr/local/bin/python3'
  let g:pymode_python                = '/usr/local/bin/python3'
else
  let g:loaded_jedi = 1
endif

" set the keymapping for definition browsing (-t)
let g:jedi#goto_definitions_command   = "<leader>t"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#auto_close_doc             = 1

if has("gui_running")
    g:ycm_filetype_specific_completion_to_disable = { 'python': 1 }
endif


" custom settings for python through syntastic checker
let g:syntastic_enable_highlighting        = 1
let g:airline#extensions#syntastic#enabled = 1
let g:syntastic_python_python_exec         = '/usr/local/bin/python3'
" Using pylint as syntax checker and linting
"let g:syntastic_python_checkers            = ['pylint']
"let g:syntastic_python_pylint_args         = '--disable=C0103'
" Using flake8 as syntax checking and linting
let g:syntastic_python_checkers            = ['flake8']
"let g:syntastic_python_flake8_args        = '--ignore="D400"'
let g:syntastic_python_flake8_args         = '--ignore="D400,E501,E302,E261,E701,E241,E126,E127,E128,W801"'

" syntastic checker settings for c and c++
"let g:syntastic_c_compiler                = 'gcc'
"let g:syntastic_cpp_compiler              = 'g++'
let g:syntastic_c_compiler                = '/usr/bin/clang'
let g:syntastic_cpp_compiler              = '/usr/bin/clang++'
let g:syntastic_cpp_compiler_options      = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_cpp_cpplint_exec          = 'cpplint'
let g:syntastic_cpp_check_header          = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_include_dirs          = ['/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1',
                                           \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include',
                                           \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
                                           \ '/usr/include',
                                           \ '/usr/local/include',
                                           \ '/usr/local/opt/opencv3/include',
                                           \ '/usr/local/Cellar/opencv3/HEAD-a4db983_4/include'
                                           \ ]

" show balloon with mouse hovering over an error
let g:syntastic_enable_balloons = 1

" python language specific customizations
" enable all the python syntax highlighting features
let python_highlight_all=1

" choose the python binary to select while using YouCompleteMe
if has('python')
    let g:ycm_python_binary_path        = '/usr/local/bin/python'
    let g:ycm_server_python_interpreter = '/usr/local/bin/python'
else
    let g:ycm_python_binary_path        = '/usr/local/bin/python3'
    let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
endif

" ------------------------------------------------------------------------------------
" --- miscellaneous ycmd settings (https://valloric.github.io/YouCompleteMe)       ---
" --- additional ycm settings including the location of configuration file         ---
" ------------------------------------------------------------------------------------
let g:ycm_global_ycm_extra_conf                         = '~/.vim/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist                           = ['~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/*','!~/*']
let g:ycm_always_populate_location_list                 = 0
let g:ycm_auto_trigger                                  = 1
let g:ycm_enable_diagnostic_highlighting                = 1
let g:ycm_enable_diagnostic_signs                       = 1
let g:ycm_max_diagnostics_to_display                    = 10000
let g:ycm_min_num_identifier_candidate_chars            = 0
let g:ycm_min_num_of_chars_for_completion               = 1
let g:ycm_open_loclist_on_ycm_diags                     = 1
let g:ycm_show_diagnostics_ui                           = 1
let g:ycm_collect_identifiers_from_tags_files           = 1
let g:ycm_complete_in_comments                          = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt                    = 1
let g:ycm_server_log_level                              = 'info'
let g:ycm_filetype_blacklist                            = {
            \ 'vim' : 1,
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'md' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1
            \}
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s','re!\[.*\]\s'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'erlang' : [':'],
  \   'haskell' : ['.']
  \ }


" Default YCM key bindings conflict with those of UltiSnips. Both YCM and UltiSnips
" suggest mapping expansion triggers to different keys, which did was a bit fuzzy,
" so decided to remove any key maps for ycm.
" we will be able to cycle through completion with <C-N> and <C-P> keys

" let g:ycm_key_list_select_completion   = []
" let g:ycm_key_list_previous_completion = []


" ------------------------------------------------------------------------------------
" ---------        customizations and settings for vim-clang and cpp         ---------
" ------------------------------------------------------------------------------------
let g:clang_c_options            = '-std=gnu11'
let g:clang_cpp_options          = '-std=c++11 -stdlib=libc++'
" Clang-Format Setup
let g:clang_format#style_options = {
    \ "Standard": "Cpp11",
    \ "SortIncludes": "false",
    \ "AccessModifierOffset": -4,
    \ "PointerBindsToType": "false",
    \ "DerivePointerBinding": "false",
    \ "AllowShortLoopsOnASingleLine": "false",
    \ "AllowShortBlocksOnASingleLine" : "false",
    \ "AllowShortIfStatementsOnASingleLine": "false",
    \ "AlwaysBreakTemplateDeclarations": "false",
    \ "AlignConsecutiveDeclarations": "true",
    \ "AlignConsecutiveAssignments": "true",
    \ "AlignEscapedNewlinesLeft": "true",
    \ "AlignTrailingComments": "true",
    \ "AlignOperands": "true",
    \ "ColumnLimit": 80,
    \ "TabWidth": 4
    \ }

" select the file type for ClangFormat
au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>= :ClangFormat<cr>

" languages to load clang-based plugins for (YCM, color_coded)
let g:clang_languages = ['c', 'cpp', 'objc', 'python', 'haskell']

" set the CLANG library path manually
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

" user options for clang
let g:clang_user_options = '-std=c++11' .
                         \ '-stdlib=libc++' .
                         \ '-I/usr/include' .
                         \ '-I/usr/local/include' .
                         \ '-I/usr/local/opt/opencv3/include' .
                         \ '-I/usr/local/Cellar/opencv3/HEAD-a4db983_4/include/opencv' .
                         \ '-I/usr/local/Cellar/opencv3/HEAD-a4db983_4/include'
let g:clang_sort_algo       = "priority"
let g:clang_snippets_engine = "ultisnips"


" Doxygen for CPP and Python Documentation settings
autocmd Filetype c,cpp set comments^=:///
let g:DoxygenToolkit_commentType = "C++"

" ------------------------------------------------------------------------------------
" -----               vim-cpp-enhanced-highlight custom settings                 -----
" ------------------------------------------------------------------------------------
let g:cpp_class_scope_highlight           = 1        " highlight class scope
let g:cpp_experimental_template_highlight = 1        " highlight template functions
let g:cpp_concepts_highlight              = 1        " highlight library concepts


" ------------------------------------------------------------------------------------
" ---                 ultisnips snippets for python2 and python3                   ---
" ------------------------------------------------------------------------------------
if has("python")
    let g:UltiSnipsUsePythonVersion = 2
else
    let g:UltiSnipsUsePythonVersion = 3
endif

" ------------------------------------------------------------------------------------
" -----------      javascript code beautifying & character concealing      -----------
" ------------------------------------------------------------------------------------
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call JsBeautify()<cr>
" Character Concealing in the editor mode
" https://github.com/pangloss/vim-javascript
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"


" javascript-libraries-syntax customization
let g:used_javascript_libs = 'underscore,angularjs,jasmine,chai'

" real time syntax checking with jshint lint for javascript
" jshint will be installed as a dependency while installing the syntastic
" vim plugin using the underlying os x npm installer
let g:syntastic_javascript_checkers = ['jshint']

" show any javascript based linting errors immediately
let g:syntastic_check_on_open = 1

" auto-complete using NeoCompletion for JavaScript
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS


" custom colors and alerts in common editing
highlight Cursor guifg=pink guibg=black
highlight Search guifg=black guibg=gray

highlight CommaAndNonSpace      ctermbg=red guifg=white guibg=red
highlight EOLSpace              ctermbg=red guifg=white guibg=red
highlight HashRocketAndNonSpace ctermbg=red guifg=white guibg=red
highlight NonSpaceAndHashRocket ctermbg=red guifg=white guibg=red
highlight SpaceAndComma         ctermbg=red guifg=white guibg=red
highlight Tab                   ctermbg=red guifg=white guibg=red
highlight WideEisuu             ctermbg=red guifg=white guibg=red
highlight WideSpace             ctermbg=red guifg=white guibg=red


function! s:highlight_general_checkstyles()
    "let w:m1=matchadd('Tab', '    ', -1)
    let w:m1=matchadd('WideSpace', '　', -1)
    let w:m2=matchadd('EOLSpace', '\s\+$', -1)
    let w:m3=matchadd('WideEisuu', '[Ａ-Ｚａ-ｚ０-９]', -1)
    "let w:m4=matchadd('SpaceAndComma', ' ,', -1)
    "let w:m5=matchadd('CommaAndNonSpace', ',[^(\\n| )]', -1)
    "let w:m6=matchadd('Tab', '\t', -1)
endf

call s:highlight_general_checkstyles()


" ------------------------------------------------------------------------------------
" -------                settings for the matching tag highlight               -------
" ------------------------------------------------------------------------------------
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1
    \ }


" ------------------------------------------------------------------------------------
" -------           custom settings for the vim-startify plugin                -------
" ------------------------------------------------------------------------------------
let g:startify_custom_header           = startify#fortune#boxed()
let g:startify_list_order              = ['sessions', 'files', 'dir', 'bookmarks']
let g:startify_session_persistence     = 1
let g:startify_session_delete_buffers  = 1
let g:startify_change_to_vcs_root      = 1
let g:startify_empty_buffer_key        = 'n'
let g:startify_relative_path           = 1
let g:startify_files_number            = 20
autocmd User Startified AirlineRefresh
try
  autocmd BufEnter * call StartifyConfig()     " call function from custom_functions.vim
catch
  "echo "function cannot be executed until startify plugin is installed"
endtry

" ------------------------------------------------------------------------------------
" -------                     balloon eval for gvim / gui                      -------
" ------------------------------------------------------------------------------------
if has("ballooneval")         " available only for gvim
    set ballooneval           " balloons  act  as small hover menus
endif


" END OF THE PLUGIN SETTINGS
" =====================================================================================
