"
"
"   ██╗   ██╗ ██╗ ███╗   ███╗ ██████╗   ██████╗
"   ██║   ██║ ██║ ████╗ ████║ ██╔══██╗ ██╔════╝
"   ██║   ██║ ██║ ██╔████╔██║ ██████╔╝ ██║
"   ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ██╔══██╗ ██║
" ██╗╚████╔╝  ██║ ██║ ╚═╝ ██║ ██║  ██║ ╚██████╗
" ╚═╝ ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ╚═╝  ╚═╝  ╚═════╝
"
"
" Sampath Singamsetty (Singamsetty.Sampath@gmail.com)
" Last Updated Date: 11 Dec 2016
"
" Customized .vim configuration file
" It supports some of the major languages which I use
" Haskell
" Erlang
" JavaScript ... flavors
" Python 3
" Scala
" Clojure (I don't use, but started learning)
"
" Original configuration template used from Yann Esposito
" http://yannesposito.com
" THANKS TO @yogsototh
" also a great site for vimrc generation at http://5.vim-bootstrap.appspot.com/
"
" ============================= VERY IMPORTANT ============================
" ====        To install plugin the first time:                        ====
" ====        > vim +BundleInstall +qall                               ====
" ====        cd ~/.vim/bundle/vimproc.vim && make                     ====
" ====        cabal install ghc-mod                                    ====
" =========================================================================
"
"
" #########################################################################
" #########         for unicode support character and font        #########
" #########################################################################
" For UNICODE support of symbols like "⚠"
" note: set encoding BEFORE scriptencoding
set encoding=utf-8
scriptencoding utf-8

" ########################################################################
" ########################    Plugin conf start   ########################
" ########################################################################

call plug#begin('~/.vim/plugged')
"
" #### set rtp+=~/.vim/vundle/Vundle.vim/
" set rtp+=~/.vim/bundle/vundle/
" ### call vundle#rc()
" the vundle plugin to install vim plugin
" Bundle 'gmarik/vundle'
" completion during typing
" Plugins section {{{
"
" --- syntax checking and code formatting
" syntastic needs jshint for checkin the javascript and inorder to include
" the dependency a function is defined here to handle npm installation
function! InstallJsHint(info)
    if a:info.status == 'installed' || a:info.force
        !npm install -g jshint
    endif
endfunction
Plug 'scrooloose/syntastic', { 'do': function('InstallJsHint') } " realtime syntax checker
"Plug 'scrooloose/syntastic'                                     " realtime syntax checker
Plug 'Chiel92/vim-autoformat'                                    " easy code formatting in vim
Plug 'Shougo/neocomplete.vim'                                    " neocompletion with cache (need lua support)
"Plug 'neocomplcache'                                            " neo compile caching (using neocomplete for completion)

" --- 3rd party color themes
Plug 'flazz/vim-colorschemes'                                 " Color Schemes
Plug 'morhetz/gruvbox'                                        " Retro groove color scheme
Plug 'trusktr/seti.vim'                                       " seti colorscheme
Plug 'altercation/vim-colors-solarized'                       " solarized color schemes

" --- the right way to handle trailing-whitespace
Plug 'bronson/vim-trailing-whitespace'                        " remove trailing whitespaces

" --- A Tree for file browser and Undo list
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }        " NERDTree file browser

" --- depending on your vimproc location
" --- you have to go to .vim/plugin/vimproc.vim and do a ./make
Plug 'Shougo/vimproc.vim', { 'do': 'make' }                   " vimproc
Plug 'Shougo/unite.vim'                                       " unite
Plug 'mhinz/vim-startify'                                     " fancy start screen for vim

" --- for commenting the code
Plug 'scrooloose/nerdcommenter'                               " intensely orgasmic commenting

" --- git integration
Plug 'tpope/vim-fugitive'                                       " git integration
Plug 'airblade/vim-gitgutter'                                   " show which line changed using git
Plug 'mhinz/vim-signify'                                        " show diff via vim sign column

" --- for aligning the code and or text manipulation
Plug 'junegunn/vim-easy-align'                                  " text and code alignment
Plug 'godlygeek/tabular'                                        " text filtering and alignment
Plug 'nathanaelkane/vim-indent-guides'                          " vim indentation display
Plug 'ervandew/supertab'                                        " use TAB for all insertions

" --- for haskell language auto-complete, syntax and code check(load only for haskell)
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }          " syntax indentation / highlight
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }      " unicode for concealing haskell operators
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }                " ghcmod for haskell in vim
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }                  " ghc haskell
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }                " Hoogle haskell search
Plug 'pbrisbin/html-template-syntax', { 'for': 'haskell' }      " Yesod templates
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }                 " HDevTools for Haskell
Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }       " Stylish Haskell
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }      " Hlint refactor
Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell'}          " haskell indent plugin
Plug 'dan-t/vim-hsimport', {'for': 'haskell'}                   " plugin for hsimport
"Plug 'dag/vim2hs'                                              " vimscripts for haskell development

" --- for idris language syntax
Plug 'idris-hackers/idris-vim'                                  " idris language support

" --- for agda language support
Plug 'rking/ag.vim'                                             " AGDA language

" --- for elm-lang scripting support
Plug 'lambdatoast/elm.vim'                                      " elm scripting language

" --- for some eye candies like status bars and colors
"Plug 'bling/vim-airline'                                       " using vim-airline repo
"Plug 'bling/vim-bufferline'                                    " show number of buffers
Plug 'vim-airline/vim-airline'                                  " Airline statusbar
Plug 'vim-airline/vim-airline-themes'                           " Airline themes
Plug 'majutsushi/tagbar'                                        " tagbar support

" --- for rainbow parenthesis colorful brackets
Plug 'kien/rainbow_parentheses.vim'                             " rainbow parenthesis

" --- for clojure language auto-completion, syntax and formatting
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }            " clojure support
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }               " clojure formatting tool
Plug 'venantius/vim-eastwood', { 'for': 'clojure'}              " clojure lint tool
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }                " clojure support
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }       " clojure and scheme support

" --- some utilities
Plug 'guns/vim-sexp'                                             " vim expression support
Plug 'tpope/vim-repeat'                                          " vim repeat the last command on
Plug 'tpope/vim-surround'                                        " parenthesizing made simple
" --- vim-fireplace dependencies
"Plug 'tpope/vim-classpath'                                      " vim classpath
"Plug 'jpalardy/vim-slime'                                       " slime for vim
" Plug 'Bogdanp/browser-connect.vim'                             " browser integration (reload browser on change)

" --- for java script syntax check and auto-completions
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }           " beautify javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }          " javascript for vim
Plug 'othree/yajs.vim', { 'for': 'javascript' }                  " yet another javascript - lazy loading
Plug 'einars/js-beautify', { 'for': 'javascript' }               " javscript beautify
Plug 'bigfish/vim-js-context-coloring', { 'for': 'javascript' }  " javascript highlighting, context coloring in vim
" --- extends syntax for with jQuery,backbone,etc
Plug 'othree/javascript-libraries-syntax.vim'                    " javascript library support
Plug 'mxw/vim-jsx'                                               " json/js support
Plug 'elzr/vim-json'                                             " json highlighting
Plug 'othree/javascript-libraries-syntax.vim'                    " javascript syntax check and library support

" for erlang language auto-completions, syntax check and support
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }        " erlang runtime check
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }   " erlang code auto completion
Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }       " erlang support

" --- allow pane movement to jump out of vim into tmux navigator
Plug 'christoomey/vim-tmux-navigator'                            " terminal multiplex

" --- for scala language auto-complete, syntax and support
Plug 'derekwyatt/vim-scala', { 'for': 'scala'}                   " scala support
"Plug 'ensime/ensime-vim'                                        " ensime for scala auto-complete (uses python2 | commented)

" --- for html, xml ... syntax, validation etc.
Plug 'othree/html5.vim'                                          " html5 support
Plug 'othree/xml.vim', { 'for': 'xml' }                          " xml support
Plug 'Valloric/MatchTagAlways'                                   " highlight matching tags on markup languages

" --- for c/c++ language support (load on demand only)
Plug 'justmao945/vim-clang', { 'for': ['cpp','c'] }           " clang completion plugin for vim
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }     " additional vim syntax highlighting
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': 'cpp' }       " doxygen documentation
"Plug 'Rip-Rip/clang_complete'                                " clang completion
Plug 'myint/clang-complete', { 'for': ['cpp','c']}            " using fork for python3 support
"Plug 'Valloric/YouCompleteMe', { 'for': ['cpp','python'] }   " ycm
Plug 'vim-scripts/c.vim', { 'for': ['c','cpp'] }              " c/cpp ide
"Plug 'jeaye/color_coded'                                     " libclang based highlighting for c/c++/objc

" --- miscellaneous utilities
Plug 'edkolev/promptline.vim'                                 " promptline
Plug 'kien/ctrlp.vim'                                         " fuzzy file, buffer, mru, tag etc
Plug 'vim-ctrlspace/vim-ctrlspace'                            " tabs/buffers/file management
Plug 'tyru/current-func-info.vim'                             " get current function name
Plug 'jiangmiao/auto-pairs'                                   " parenthesis auto parentheses pairing

" --- plugins for vim textual snippets supporting code auto completion
Plug 'tomtom/tlib_vim'                                               " for snippets
Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'garbas/vim-snipmate'     " for snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'                  " vim-snippets depends on ultisnippets
"Plug 'hecal3/vim-leader-guide'                                      " vim keymap-display

" --- Plugins for multiple text selection
Plug 'terryma/vim-multiple-cursors'                           " vim multiple cursors

" --- for elixir auto-complete syntax checking and development
Plug 'elixir-lang/vim-elixir'                                 " vim for elixir
Plug 'slashmili/alchemist.vim'                                " elixir integration for vim

" --- for documentation purposes and writing
Plug 'vim-pandoc/vim-pandoc'                                  " pandoc integration and utilities
Plug 'vim-pandoc/vim-pandoc-syntax'                           " pandoc markdown syntax

" --- for python/python3 language auto-completion, syntax checking, highlighting and more
Plug 'vim-scripts/python.vim--Vasiliev'                       " enhanced python syntax highlighting
Plug 'davidhalter/jedi-vim'                                   " python jedi auto-completion (the best)
"Plug 'lambdalisue/vim-pyenv'                                 " python virtual env (if required)
"Plug 'Valloric/YouCompleteMe', { 'for': ['cpp','python'] }   " ycm (not used in normal vim mode)

"########################################################################################################
" YCM Installation notes (OS X)
" install ycm only for macvim in gui; some additional steps has to be followed
" for innstalling the ycm plugin. once the plugin is downloaded to the
" appropriate location go to .vim/plugged/youcompleteme, and set environment
" variable as follows
" export
" EXTRA_CMAKE_ARGS="-DEXTERNAL_LIBCLANG_PATH=/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"
" using the installation script execute below,
" python3 ./install.sh --clang-completer --system-libclang
"
"if has("python") || has("gui_running")
"    Plug 'valloric/youcompleteme', { 'do': '/usr/local/bin/python3 install.py
"                                           --clang-completer --system-clang
"                                           --gocode-completer --tern-completer' }
"endif
"########################################################################################################
if has("gui_running")
    Plug 'valloric/youcompleteme', { 'for': ['cpp','python'] }
endif
"}}}

call plug#end()

" ########################################################################
" ########################     Plugin conf end    ########################
" ########################################################################

set nocompatible
set hidden

filetype plugin on
filetype indent on

" Italics for comments
highlight Comment cterm=italic
highlight htmlArg cterm=italic

" ########################################################################
" ########################  Plugin customizations ########################
" ########################################################################

" ************************************************************************************
" ************                     Leader key mapping                     ************
" ************************************************************************************
" use the option "-" + <keymap> for all shortcuts
let mapleader   = "-"
let g:mapleader = "-"
set tm=2000

" ************************************************************************************
" ************             Auto formatting options                      **************
" ************************************************************************************
nnoremap <silent> <Leader>f :Autoformat<CR>
let g:formatters_python = ['yapf']
let g:formatdef_yapf = '"yapf --style=''{based_on_style:pep8,indent_width:".&shiftwidth."}'' -l ".a:firstline."-".a:lastline'

" ************************************************************************************
" **********                  nerdcommenter customizations                  **********
" ************************************************************************************
" allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" ************************************************************************************
" **************               Supertab TAB Completions                  *************
" ************************************************************************************
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
" set the colorscheme to solarized light if running macvim
if has("gui_running")
    colorscheme solarized
    let g:airline_theme = 'cool'
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
    if has("unix")
        inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
    endif
endif

" ************************************************************************************
" ************                 Haskell ghc customization                   ***********
" ************************************************************************************
" normal mode key mappings (ex: press -ht)
nmap <silent> <leader>ht :GhcModType<CR>
nmap <silent> <leader>he :GhcModTypeClear<CR>
nmap <silent> <leader>hi :GhcModTypeInsert<CR>
nmap <silent> <leader>hs :GhcModSplitFunCase<CR>
nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>:lopen<CR>
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>:lopen<CR>

"let g:syntastic_mode_map={'mode': 'active', 'passive_filetypes': ['haskell']}
let g:syntastic_mode_map={'mode': 'active',
                        \ 'active_filetypes': ['haskell', 'python', 'cpp'],
                        \ 'passive_filetypes': []}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
" for skipping syntax the checking while exiting vim using :wq
let g:syntastic_check_on_wq = 0

" auto-checking on writing
autocmd BufWritePost *.hs,*.lhs GhcModCheckAndLintAsync

" key-bindings for the haskell hdevtools type info
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" ************************************************************************************
" **********                 for haskell-vim customization                  **********
" ************************************************************************************
let g:haskell_enable_quantification   = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1   " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1   " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1   " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1   " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1   " to enable highlighting of `static`

" ************************************************************************************
" *****                       for nerdtree configuration                         *****
" ***** invoke by using the leader key map as - + nt                             *****
" ************************************************************************************
nmap <leader>nt :NERDTreeToggle<CR>

" ************************************************************************************
" *****                      for tab alignment configuration                     *****
" ************************************************************************************
let g:haskell_tabular = 1
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /<-<CR>

" ************************************************************************************
" *****                     neco-ghc (haskell autocompleion)                     *****
" ************************************************************************************
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
" -- Frege
autocmd BufEnter *.fr :filetype haskell

" ************************************************************************************
" ********   Next generation completion framework after neocomplcache         ********
" ********               neocomplcache (advanced completion)                  ********
" ********    using neocomplete instead of the neocomplete cache              ********
" ************************************************************************************
" to disable AutoComplPop.
"let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1                    " use neocomplete at startup
let g:neocomplete#enable_smart_case = 1                    " use smart-case
let g:neocomplete#sources#syntax#min_keyword_length = 2    " set minimum syntax keyword length
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'      " regex for buffer name
" define a dictionar
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

" define keyword
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" plugin key mappings
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" settings for enabling the omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType python setlocal omnifunc=python3complete#Complete
if has('python3')
    autocmd FileType python setlocal omnifunc=python3complete#Complete
else
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
endif

autocmd BufRead,BufNewFile *.go set filetype=go

" ************************************************************************************
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

" ************************************************************************************
" *********              ctrlspace customization settings                   **********
" *********  getting help with the below options                            **********
" *********  :help g:CtrlSpaceSymbols                                       **********
" ************************************************************************************
if has("gui_running")
    " Settings for vim and monaco powerline font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif

" ************************************************************************************
" ***********                    CtrlP customized bindings                  **********
" ************************************************************************************
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ************************************************************************************
" **************       customizing the vim git gutter                     ************
" ************************************************************************************
highlight clear SignColumn
highlight SignColumn ctermbg=0
nmap gn <Plug>GitGutterNextHunk
nmap gN <Plug>GitGutterPrevHunk
let g:gitgutter_realtime = 0

" ************************************************************************************
" ************                        File Management                      ***********
" ************************************************************************************
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

" ************************************************************************************
" ******** Clojure language customization with rainbow paranetheses          *********
" ************************************************************************************
" Clojure
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesActivate
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadRound
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadSquare
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadBraces
" Fix I don't know why
autocmd BufEnter *.cljs,*.clj,*.cljs.hl setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:

" ************************************************************************************
" ****** customizing the rainbow parenthesis with choice of colors depth 9     *******
" ************************************************************************************
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


" ######################################################################
" ####################### Personal Configuration #######################
" ######################################################################

" Use powerline fonts for airline
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" vim powerline symbols in statusbar
set guifont =Monaco\ for\ Powerline:h12
let g:airline_powerline_fonts             = 1
let g:airline_symbols.space               = "\ua0"
let g:Powerline_symbols                   = 'fancy'
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set bs=2		            " allow backspacing over everything in insert mode
set viminfo='20,\"50        " read/write a .viminfo file, don't store more
			                " than 50 lines of registers
set history=10000           " keep 100000 lines of command line history
set ruler                   " show the cursor position all the time
syntax on                   " syntax highlighting
set hlsearch                " highlight searches
set laststatus=2            " always show the status line
set visualbell              " no beep
" for 256 color terminal support
if &term =~ '256color'
   " disable Background Color Erase (BCE) so that color schemes
   " render properly when inside 256-color tmux and GNU screen.
   " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif


" Undo
if has('persistent_undo')
    set undofile                " Persistent undo
    set undodir=~/.vim/undop    " Location to store undo history
    set undolevels=1000         " Max number of changes
    set undoreload=10000        " Max lines to save for undo on a buffer reload
endif


" move between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" sudo save
cmap w!! w !sudo tee >/dev/null %

" Tab and indentation management
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
set cinoptions=(0,u0,U0

" Spellchecking
if has("spell") " if vim support spell checking
    " Download dictionaries automatically
    if !filewritable($HOME . "/.vim/spell")
        call mkdir($HOME . "/.vim/spell","p")
    endif
    set spellsuggest=10 " z= will show suggestions (10 at most)
    " spell checking for text, HTML, LaTeX, markdown and literate Haskell
    autocmd BufEnter *.txt,*.tex,*.html,*.md,*.ymd,*.lhs setlocal spell
    autocmd BufEnter *.txt,*.tex,*.html,*.md,*.ymd,*.lhs setlocal spelllang=fr,en
    " better error highlighting with solarized
    highlight clear SpellBad
    highlight SpellBad term=standout ctermfg=2 term=underline cterm=underline
    highlight clear SpellCap
    highlight SpellCap term=underline cterm=underline
    highlight clear SpellRare
    highlight SpellRare term=underline cterm=underline
    highlight clear SpellLocal
    highlight SpellLocal term=underline cterm=underline
endif

" Alignment Helper
" Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<cr>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" .ymd file type
autocmd BufEnter *.ymd set filetype=markdown
autocmd BufEnter *.cljs,*.cljs.hl set filetype=clojure
"  Reload browser on cljs save
"  don't forget to put <script src="http://localhost:9001/ws"></script>
"  in your HTML
"  au BufWritePost *.cljs :BCReloadPage


" Searing red very visible cursor
" red back ground
hi Cursor guibg=red


" Use same color behind the concealed unicode characters
hi clear Conceal

" Easier anti-quote
imap éé `

" -- show the column number 81
if (exists('+colorcolumn'))
    "set colorcolumn=80
    set colorcolumn=120
    highlight ColorColumn ctermbg=0
endif

" --- type ° to search the word in all files in the current dir
nmap ° :Ag <c-r>=expand("<cword>")<cr><cr>

" set noswapfile
" ---------- vim-pandoc folding -----------
let g:pandoc#modules#disabled = ["folding"]

" ************************************************************************************
" --------                      Slime configuration                          ---------
" ************************************************************************************
vmap <silent> <Leader>rs <Plug>SendSelectionToTmux
nmap <silent> <Leader>rs <Plug>NormalModeSendToTmux
nmap <silent> <Leader>rv <Plug>SetTmuxVars

" ***********************************************************************************
" -----                  terminal multiplex (TMUX) configuration                  ---
" ***********************************************************************************
" Manually create key mappings (to avoid rebinding C-\)
let g:tmux_navigator_no_mappings = 1
let g:slime_target = "tmux"
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Support for pointfree styles
" In visual mode you can now press gq to convert a expression to it’s
" pointfree form.Though quite often the resulting form is more
" obfuscated than the original.
autocmd BufEnter *.hs set formatprg=pointfree

" **********************************************************************************
" /////////////  FANCY abcdefgh in status bar (copied from airline blog) ///////////
" **********************************************************************************
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
" let g:airline_enable_syntastic                = 0  " deprecated
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled        = 1
let g:airline_section_y                         = 'BN: %{bufnr("%")}'

" for erlang development support - syntaxerl
let g:syntastic_erlang_checkers=['syntaxerl']
" man pages
let g:erlangManPath='/usr/local/Cellar/erlang/19.1/man'

" **********************************************************************************
" ********                  personal settings for Syntastic                *********
" ***** By default, Syntastic uses arrow symbols to indicate line with error. ******
" ***** To spice things up, you can specify any Unicode symbol as the symbol. ******
" **********************************************************************************
" getbg function
" gets background of a highlighting group with fallback to SignColumn group
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

" syntastic display error and warning symbols
let g:syntastic_error_symbol         = "✗"
let g:syntastic_warning_symbol       = "⚠"
let g:syntastic_style_error_symbol   = '✍'
let g:syntastic_style_warning_symbol = '✍'
hi! link SyntasticErrorLine Visual
hi! link SyntasticWarningLine Visual
au VimEnter,ColorScheme * exec 'hi! SyntasticErrorSign guifg=red ctermfg=red ' . s:getbg('SyntasticErrorLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticWarningSign guifg=yellow ctermfg=yellow ' . s:getbg('SyntasticWarningLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticError ' . s:getbg('SyntasticErrorLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticWarning ' . s:getbg('SyntasticWarningLine')


" **********************************************************************************
" ********   python/python3 and JEDI syntastic integration for checking    *********
" **********************************************************************************
" jedi auto-completion and syntax check for python3
" the below section first does a check on which python to choose
if has('python')
  let g:jedi#force_py_version        = 2
  let g:syntastic_python_python_exec = 'python2'
  let g:pymode_python                = 'python2'
elseif has('python3')
  "let g:jedi#force_py_version       = 3
  let g:syntastic_python_python_exec = 'python3'
  let g:pymode_python                = 'python3'
else
  let g:loaded_jedi = 1
endif

let g:jedi#goto_definitions_command = "<leader>t"

" custom settings for python through syntastic
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

" syntastic settings for cpp
let g:syntastic_cpp_compiler              = "g++"
let g:syntastic_cpp_check_header          = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_include_dirs          = ['/usr/include',
                                           \ '/usr/local/include',
                                           \ '/usr/local/Cellar/opencv3/HEAD-6328076_4/include'
                                           \ ]

" show ballon with mouse hovering over error
let g:syntastic_enable_balloons = 1

" Python Specific Custmoizations
" enable all Python syntax highlighting features
let python_highlight_all=1

" choose the python binary for ycm
if has('python')
    let g:ycm_python_binary_path        = '/usr/local/bin/python'
    let g:ycm_server_python_interpreter = '/usr/local/bin/python'
else
    let g:ycm_python_binary_path        = '/usr/local/bin/python3'
    let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
endif
" additional ycm settings including the configuration file location
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist=['~/.vim/*']
let g:ycm_always_populate_location_list = 0
let g:ycm_auto_trigger=1
let g:ycm_enable_diagnostic_highlighting=1
let g:ycm_enable_diagnostic_signs=1
let g:ycm_max_diagnostics_to_display=10000
let g:ycm_min_num_identifier_candidate_chars=0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_open_loclist_on_ycm_diags=1
let g:ycm_show_diagnostics_ui=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_blacklist={
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


" -------------------------------------------------------------------------
" ---                         vim-clang and cpp                         ---
" -------------------------------------------------------------------------
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
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
au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>= :ClangFormat<cr>

let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

" Doxygen
autocmd Filetype c,cpp set comments^=:///
let g:DoxygenToolkit_commentType = "C++"


" Switch between source and header files using ctags
" only supports .cpp and .h
function! Switch()
    let baseName=expand('%:t:r')
    let extension=expand('%:e')
    if extension =~ 'c'
        execute "tag " . baseName . '.h'
    else
        execute "tag " . baseName . '.cpp'
    endif
endfunction
nmap <silent> <Leader>fs :call Switch()<CR>

" ultisnips for python2 and python3
if has("python")
    let g:UltiSnipsUsePythonVersion = 2
else
    let g:UltiSnipsUsePythonVersion = 3
endif

" **********************************************************************************
" ************                  javascript code beautifying             ************
" **********************************************************************************
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
let g:syntastic_javascript_checkers = ['jshint']
" show any linting errors immediately
let g:syntastic_check_on_open = 1
" auto-complete using neocompletion for javascript
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" custom colors and alerts in common
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
    " let w:m4=matchadd('SpaceAndComma', ' ,', -1)
    " let w:m5=matchadd('CommaAndNonSpace', ',[^(\\n| )]', -1)
    "let w:m6=matchadd('Tab', '\t', -1)
endf

call s:highlight_general_checkstyles()


" **********************************************************************************
" ******************** settings for the matching tag highlight *********************
" **********************************************************************************
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1
    \ }


" **********************************************************************************
" ********** ballooneval for gvim / gui                                   **********
" **********************************************************************************
if has("ballooneval") " available only for gvim
    set ballooneval   " balloons  act  as small hover menus
endif


" **********************************************************************************
" ********  ctags generated using exuverant ctags at /usr/local/bin/ctags   ********
" * /usr/local/bin/ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q  ****
" * --language-force=C++ -f opencv                                              ****
" *  /usr/local/Cellar/opencv3/HEAD-6328076_4/include/                          ****
" **********************************************************************************
set tags+=~/tags/opencv

" for MacVim specific settings
" override macvim color scheme
let macvim_skip_colorscheme=1
" =====================================================================================
