" ╔═══════════════════════════════════════════════════════════════════════════════════╗
" ║ $$             All Vim plugins installed through Vim Plugin Manager            $$ ║
" ╚═══════════════════════════════════════════════════════════════════════════════════╝

"         list of all the plugins to be installed through vimplug
"         Thanks to https://github.com/junegunn/vim-plug

" ######################## set rtp+=~/.vim/vundle/Vundle.vim/ ########################
" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/vundle/
" the vundle plugin is used only for initial installation of the vim plugin
" Bundle 'gmarik/vundle'
" ################################# call vundle#rc() #################################

" ############################## Plugins sections start ##############################
" ##    syntax checking and code formatting with syntastic vim plugin               ##
" ##    syntastic needs jshint for checking the javascript and inorder to include   ##
" ##    the dependency, a function is defined here to handle the npm installation   ##
" ####################################################################################
scriptencoding utf-8

" custom installation helper functions
function! InstallJsHint(info)
    if a:info.status ==# 'installed' || a:info.force
        !npm install -g jshint
    endif
endfunction

function! MakeInstall(info)
    if a:info.status ==# 'installed' || a:info.force
        !make install
    endif
endfunction

function! GitRecurse(info)
    if a:info.status ==# 'installed' || a:info.force
        !git submodule update --init --recursive
    endif
endfunction

function! InstallJsBeautify(info)
    if a:info.status ==# 'installed' || a:info.force
        !git submodule update --init --recursive
        !npm install js-beautify
    endif
endfunction

function! BuildTern(info)
    if a:info.status ==# 'installed' || a:info.force
        !npm install
        !npm install -g tern
    endif
endfunction

function! GetImport(info)
    if a:info.status ==# 'installed' || a:info.force
        !npm install
        !npm install -g import-js
    endif
endfunction

"Function: InstallTS
"Desc: Install TypeScript node binaries
"
"Arguments: info
" check if installed or not
function! InstallTS(info)
    if a:info.status ==# 'installed' || a:info.force
        !npm install -g clausreinke/typescript-tools typescript
    endif
endfunction

" function for handling the YouCompleteMe post build and installation
function! YCMBuilder(info)
    " info dictionary structure has following 3 fields
    " -- name: name of plugin
    " -- status: 'installed', 'updated', 'unchanged'
    " -- force: set with PlugInstall! or PlugUpdate!
    if a:info.status ==# 'installed' || a:info.force
        let $EXTRA_CMAKE_ARGS='-DEXTERNAL_LIBCLANG_PATH'
                    \ . '='
                    \ . '/opt/software/clang+llvm-6.0.0-x86_64-apple-darwin/lib/libclang.dylib'
                    "\ . '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
        !python3 install.py --clang-completer --system-libclang --gocode-completer --tern-completer
        !cd ./third_party/tern_runtime && npm install
    endif
endfunction

" syntax checkers {{{
if exists('g:vim_syntax_ale') && g:vim_syntax_ale
    " --- Asynchronous Lint Engine (using only syntastic for now)
    Plug 'w0rp/ale'
else
    " --- Syntastic realtime syntax checker
    Plug 'scrooloose/syntastic', { 'do': function('InstallJsHint') }
endif
" }}}

" --- auto-completion and code formatters section {{{
Plug 'Chiel92/vim-autoformat'                                                   " easy code formatting in vim
Plug 'Shougo/neocomplete.vim'                                                   " neocompletion with cache (need lua support)
Plug 'Shougo/neoinclude.vim'                                                    " include completion framework for neocomplete


" deoplete will replace neocomplete some time
Plug 'Shougo/deoplete.nvim'                                                     " dark powered neo-completion
Plug 'roxma/nvim-yarp'                                                          " Yet Another Remote Plugin Framework
Plug 'roxma/vim-hug-neovim-rpc'                                                 " neovim rpc client fpr vim8
" }}}


" --- utilities section {{{
"     for vimproc you have to go to .vim/plugin/vimproc.vim and run a ./make
Plug 'Shougo/vimproc.vim', { 'do': 'make -j4' }                                 " vimproc asynchronous
Plug 'benizi/vim-automkdir'                                                     " create dir as required
Plug 'bronson/vim-trailing-whitespace', { 'on': 'FixWhitespace' }               " remove trailing white spaces
Plug 'mhinz/vim-startify'                                                       " fancy start screen for vim
Plug 'easymotion/vim-easymotion'                                                " vim motions on speed
Plug 'Yggdroot/indentLine'                                                      " display the indention levels
Plug 'itchyny/calendar.vim'                                                     " calendar application
Plug 'tpope/vim-sleuth'                                                         " heuristically set buffer options
Plug 'tpope/vim-dispatch'                                                       " async build and test dispatcher
Plug 'conradirwin/vim-bracketed-paste'                                          " handle auto set paste
Plug 'shougo/echodoc', { 'on': ['EchoDocEnable', 'EchoDocDisable'] }            " print documents in echo area
Plug 'Shougo/context_filetype.vim'                                              " context ft library for vim
Plug 'schickling/vim-bufonly', { 'on': ['BufOnly', 'Bonly'] }                   " delete all buffers except current
Plug 'rhysd/vim-healthcheck'                                                    " polyfill of nvim's healthcheck
" }}}

"{{{ --- vim code commenting
Plug 'scrooloose/nerdcommenter'                                                 " intensely orgasmic commenting
"Plug 'tomtom/tcomment_vim'                                                     " line comment default toggle `gc`

"}}}

" --- Fuzzy Finder and other finding tools for vim {{{
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }      " helps to grep
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'

"}}}

" --- shell/terminal utilities for vim {{{
" shell in vim
Plug 'shougo/vimshell.vim'

" immediate-window for Vim script
Plug 'rbtnn/vimconsole.vim', { 'on': [
            \ 'VimConsoleLog', 'VimConsoleOpen', 'VimConsoleWarn', 'VimConsoleError',
            \ 'VimConsoleError', 'VimConsoleToggle', 'VimConsoleClear', 'VimConsoleRedraw',
            \ ],
            \ }
" }}}


" --- 3rd party color themes section {{{
Plug 'flazz/vim-colorschemes'                                                   " Color Schemes
Plug 'morhetz/gruvbox'                                                          " Retro groove color scheme
Plug 'trusktr/seti.vim'                                                         " seti colorscheme
Plug 'lifepillar/vim-solarized8'                                                " optimized solarixed scheme
Plug 'baeuml/summerfruit256.vim'                                                " 256 color scheme
Plug 'jacoborus/tender.vim'                                                     " 24bit colorscheme for Vim, Airline
Plug 'kabbamine/yowish.vim'                                                     " dark & yellowish colorscheme
Plug 'tyrannicaltoucan/vim-quantum'                                             " material color scheme
Plug 'lifepillar/vim-wwdc16-theme'                                              " dark scheme based on Apple WWDC16
Plug 'lifepillar/vim-wwdc17-theme'                                              " light scheme based on Apple WWDC17
" }}}


" --- plugins for vim textual snippets supporting code auto completion {{{
Plug 'SirVer/ultisnips'                                         " for snippets

Plug 'honza/vim-snippets'                                       " vim-snippets depends on ultisnippets
Plug 'MarcWeber/vim-addon-mw-utils'                             " for snippets
Plug 'garbas/vim-snipmate'                                      " for snippets
Plug 'shougo/neosnippet.vim'                                    " ne snippet plugin
Plug 'shougo/neosnippet-snippets'                               " neo snippets repository
Plug 'tomtom/tlib_vim'                                          " for snippets

Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }     " react js snippets
" }}}


" --- vim distraction free typing {{{
Plug 'junegunn/goyo.vim'                                                        " distraction-free writing in Vim
Plug 'junegunn/limelight.vim'                                                   " light theme for goyo
" }}}


" --- unite family plugins and extensions {{{
"Plug 'shougo/denite.nvim'                                  " nexgen unite
Plug 'Shougo/unite.vim'                                     " unite color changer helper
Plug 'Shougo/unite-outline'                                 " outline source for unite
Plug 'ujihisa/unite-colorscheme'                            " Unite color scheme browser
Plug 'Shougo/neomru.vim'                                    " includes unite.vim MRU sources
Plug 'mattn/unite-vim_advent-calendar'                      " unite source for calendar
Plug 'mattn/webapi-vim'                                     " vim interface to web api
Plug 'mattn/wwwrenderer-vim'                                " vim renderer
Plug 'thinca/vim-openbuf'                                   " open and manage buffers
Plug 'choplin/unite-vim_hacks'                              " this needs above 3 plugins
Plug 'osyo-manga/unite-option'                              " output vim options
Plug 'tsukkee/unite-help'                                   " help source for unite.vim
Plug 'osyo-manga/unite-quickfix'                            " outputs from quickfix
Plug 'zhaocai/unite-scriptnames'                            " extension for runtime scriptnames
" }}}


" --- File Exploring section {{{
Plug 'shougo/vimfiler.vim'                                                      " file explorer
Plug 'xuyuanp/nerdtree-git-plugin'                                              " NERDTree git status display
Plug 'jistr/vim-nerdtree-tabs'                                                  " NERDTree and tabs together
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }                              " undo history visualizer

Plug 'scrooloose/nerdtree' , { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }       " NERDTree file browser, Undo list
augroup nerd_tree_loade
autocmd!
autocmd VimEnter * silent! autocmd! FileExplorer
autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_tree_load'
        \| endif
augroup END
" }}}


" --- source code control, git integration sections {{{
Plug 'tpope/vim-fugitive'                                                       " git integration
Plug 'airblade/vim-gitgutter'                                                   " show which line changed using git
Plug 'mhinz/vim-signify'                                                        " show diff via vim sign column
" }}}


" --- code alignment/completion, text manipulation sections {{{
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign']  }   " text and code alignment
Plug 'godlygeek/tabular'                                                        " text filtering and alignment
Plug 'ervandew/supertab'                                                        " use TAB for all insertions
Plug 'Shougo/neco-syntax'                                                       " syntax source for neocomplete
Plug 'ujihisa/neco-look'                                                        " english lookup for neo
Plug 'nathanaelkane/vim-indent-guides'                                          " vim indentation display
"Plug 'tenfyzhong/CompleteParameter.vim'                                         " param completion after select
" }}}


" --- vim source for neocomplete {{{
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'mhinz/vim-lookup', { 'for': 'vim' }                                       " jump to vim code definitions
" }}}


" --- haskell languauge support and utilities {{{
"     auto-complete, syntax and code checking sections
"     load these plugins only while opening haskell code or source
Plug 'neovimhaskell/haskell-vim'     , { 'for': 'haskell' }                     " syntax indentation / highlight
Plug 'enomsg/vim-haskellConcealPlus' , { 'for': 'haskell' }                     " for concealing haskell operators
Plug 'eagletmt/ghcmod-vim'           , { 'for': 'haskell' }                     " ghcmod for haskell in vim
Plug 'eagletmt/neco-ghc'             , { 'for': 'haskell' }                     " ghc haskell
Plug 'Twinside/vim-hoogle'           , { 'for': 'haskell' }                     " Hoogle haskell search
Plug 'bitc/vim-hdevtools'            , { 'for': 'haskell' }                     " HDevTools for Haskell
Plug 'mpickering/hlint-refactor-vim' , { 'for': 'haskell' }                     " Hlint refactor
Plug 'itchyny/vim-haskell-indent'    , { 'for': 'haskell' }                     " haskell indent plugin
Plug 'dan-t/vim-hsimport'            , { 'for': 'haskell' }                     " plugin for hsimport
Plug 'adinapoli/cumino'              , { 'for': 'haskell' }                     " vim ghci tmux integration
Plug 'alx741/vim-stylishask'                                                    " stylish haskell integration

"Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }                      " Stylish Haskell

Plug 'pbrisbin/vim-syntax-shakespeare'                                          " syntax for highlighting template langs
Plug 'pbrisbin/html-template-syntax'                                            " Yesod templates

"Plug 'dag/vim2hs'                                                              " vimscripts for haskell development
" }}}


" --- idris language syntax section {{{
Plug 'idris-hackers/idris-vim'                                                  " idris language support
" }}}

" --- agda language support section {{{
Plug 'rking/ag.vim'                                                             " AGDA language
" }}}

" --- elm-lang scripting support section {{{
Plug 'lambdatoast/elm.vim'                                                      " elm scripting language
" }}}

" --- some eye candies like status bars and colors {{{
Plug 'vim-airline/vim-airline'                                                  " Airline statusbar
Plug 'vim-airline/vim-airline-themes'                                           " Airline themes
Plug 'osyo-manga/unite-airline_themes'                                          " preview airline themes
Plug 'majutsushi/tagbar'                                                        " tagbar support
Plug 'kien/rainbow_parentheses.vim'                                             " rainbow parenthesis color brackets
Plug 'jaxbot/semantic-highlight.vim', { 'on' : [
            \ 'SemanticHighlight',
            \ 'SemanticHighlightRevert',
            \ 'SemanticHighlightToggle' 
            \ ] }                                                               " semantic highlighting
Plug 'rakr/vim-two-firewatch'                                                   " duotone light and firewatch for atom
"Plug 'bling/vim-bufferline'                                                    " show number of buffers
"Plug 'bling/vim-airline'                                                       " using vim-airline repo
" }}}


" --- clojure language {{{
"     specific auto-completion, syntax and formatting sections
Plug 'thinca/vim-ft-clojure'     , { 'for': 'clojure' }         " ft plugin for clojure
Plug 'venantius/vim-eastwood'    , { 'for': 'clojure' }         " clojure lint tool
Plug 'kovisoft/paredit'          , { 'for': 'clojure' }         " clojure support
Plug 'tpope/vim-fireplace'       , { 'for': 'clojure' }         " clojure support
Plug 'guns/vim-clojure-highlight'                               " clojure syntax hl support
Plug 'guns/vim-clojure-static'                                  " clojure synax hl support
Plug 'venantius/vim-cljfmt'                                     " clojure formatting tool

"Plug 'ujihisa/neoclojure.vim'    , { 'for': 'clojure' }        " clojure completion
"Plug 'clojure-vim/async-clj-omni' , { 'for': 'clojure' }       " async completion with deoplete
"Plug 'tpope/vim-salve'           , { 'on': [ 'Console' ] }     " static support for Leiningen
" }}}


" --- Java language section {{{
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }         " for java completion
Plug 'airblade/vim-rooter'          , { 'for': 'java' }         " change to project directory
"  }}}


" --- GO language section {{{
Plug 'fatih/vim-go'                 , { 'do': ':GoInstallBinaries' }
Plug 'tweekmonster/hl-goimport.vim' , { 'for': 'go' }
Plug 'nsf/gocode'                   , { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" }}}


" --- javascript syntax check and auto-completions section {{{
Plug 'maksimr/vim-jsbeautify', {
            \ 'do' : function('InstallJsBeautify'),
            \ 'for': ['javascript', 'html'] }                                     " beautify js
Plug 'maxmellon/vim-jsx-pretty'     , { 'for': ['javascript', 'javascript.jsx'] } " pretty hl for js[x]
Plug 'jelera/vim-javascript-syntax' , { 'for': 'javascript' }                     " enhanced js syntax
Plug 'othree/yajs.vim'              , { 'for': 'javascript' }                     " yet another js
Plug 'othree/es.next.syntax.vim'    , { 'for': 'javascript' }                     " syntax for ECMA
Plug 'othree/jsdoc-syntax.vim'      , { 'for': 'javascript' }                     " standalone jsdoc syntax
Plug 'heavenshell/vim-jsdoc'        , { 'for': 'javascript' }                     " Generate JSDoc to your JavaScript code

Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }          " js param complete

"    extended syntax for js with React,jQuery,backbone,etc
Plug 'mxw/vim-jsx'                                                           " React JSX, indenting
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }  " syntax highlighting

Plug 'elzr/vim-json'                                                        " json highlighting
Plug 'XadillaX/json-formatter.vim'  , { 'do': 'npm install jjson -g' }      " format saved JSON file
Plug 'rhysd/vim-fixjson'            , { 'do': 'npm install -g fixjson' }    " vim json fixer

Plug 'othree/javascript-libraries-syntax.vim', { 'for': [
            \ 'javascript',
            \ 'coffee',
            \ 'ls',
            \ 'typescript']
            \ }                                                                 " js syntax check and library support

Plug 'marijnh/tern_for_vim', {
            \ 'do': function('BuildTern'),
            \ 'for': ['javascript', 'javascript.jsx']}                          " tern plugin for vim js

Plug 'galooshi/vim-import-js', {
            \ 'do': function('GetImport'),
            \ 'on': ['ImportJSWord', 'ImportJSFix', 'ImportJSGoto']}            " import js

Plug 'shutnik/jshint2.vim'        , { 'for': 'javascript' }    " JSHint integration
Plug 'moll/vim-node'              , { 'for': 'javascript' }    " Tools & Env for node.js
Plug 'myhere/vim-nodejs-complete' , { 'for': 'javascript' }    " nodejs omnifunc
Plug 'mattn/jscomplete-vim'       , { 'for': 'javascript' }    " vim omnifunc for JavaScript

Plug 'jbgutierrez/vim-babel'                                   " wrapper around babel.js
Plug 'mattn/webapi-vim'                                        " vim interface to Web API

Plug '1995eaton/vim-better-javascript-completion'              " expansion of current js

"Plug 'bigfish/vim-js-context-coloring', { 'for': 'javascript' }                " js highlight, context & coloring
" }}}


" TypeScript development {{{
Plug 'Quramy/tsuquyomi' , {
            \ 'do': function('InstallTS'),
            \ 'for': 'typescript' }                             " plugin for typescript
Plug 'leafgarland/typescript-vim'   , { 'for': 'typescript' }   " typescript syntax files
Plug 'Quramy/vim-js-pretty-template', { 'for': 'typescript' }   " highlight for ts
" }}}


" erlang language auto-completions, syntax check and support section {{{
Plug 'youthy/vimerl-complete'                                                   " erlang auto complete
Plug 'vim-erlang/vim-erlang-omnicomplete' , { 'for': 'erlang' }                 " erlang code auto completion
Plug 'vim-erlang/vim-erlang-runtime'      , { 'for': 'erlang' }                 " erlang indentation and syntax
Plug 'vim-erlang/vim-erlang-compiler'     , { 'for': 'erlang' }                 " erlang syntax checker and compiler
Plug 'vim-erlang/vim-erlang-skeletons'    , { 'for': 'erlang' }                 " erlang templates
Plug 'vim-erlang/erlang-motions.vim'      , { 'for': 'erlang' }                 " erlang motions and text objects
Plug 'vim-erlang/vim-erlang-tags'                                               " erlang tag generate for vim
Plug 'ehamberg/vim-cute-erlang'           , { 'for': 'erlang' }                 " conceal for erlang
Plug 'melekes/vim-erlang-spec'            , { 'for': 'erlang' }                 " erlang generate specifications
"Plug 'oscarh/vimerl'                     , { 'for': 'erlang' }                 " erlang plugins
"Plug 'ppikula/vim-wrangler'                                                     " vim wrangler plugin
" }}}


" --- allow pane movement to jump out of vim into tmux navigator {{{
Plug 'christoomey/vim-tmux-navigator'                                           " terminal multiplex
" }}}

" --- display all the leader mappings with descriptions {{{
Plug 'ktonga/vim-follow-my-lead'
Plug 'hecal3/vim-leader-guide'                                                  " vim keymap-display
" Plug 'jimmay5469/vim-spacemacs'                                               " spacemacs key bindings
" }}}

" --- scala language auto-complete, syntax and support {{{
Plug 'derekwyatt/vim-scala', { 'for': 'scala'}                                  " scala support
"Plug 'ensime/ensime-vim'                                                       " ensime for scala auto-complete
"Plug 'megaannum/vimside'                                                       " vim scala ide
" }}}

" --- for html,css,xml ... syntax, validation etc. {{{
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'css', 'scss' ] }                    " emmet for vim
Plug 'othree/html5.vim'                                                         " html5 support
Plug 'othree/xml.vim'                                                           " xml support
Plug 'sukima/xmledit'                                                           " xml editor
Plug 'vim-scripts/xslt'                                                         " xslt ftplugin
Plug 'Valloric/MatchTagAlways'                                                  " highlight matching tags on markup's
Plug 'gko/vim-coloresque'                                                       " color preview #rrggbb or #rgb
if has('python') || has('python3')
    Plug 'Rykka/colorv.vim', { 
                \ 'for': [ 'html','javascript', 'css','sass','scss','less','slim','stylus'  ]
                \ }
endif                                                                           " color tool in vim
" }}}

" --- for c/c++ language support (load on demand only) {{{
Plug 'rhysd/vim-clang-format',           { 'on': 'ClangFormat' }                " format c,c++,obj-c,java,js and ts
Plug 'vim-scripts/OmniCppComplete',      { 'for': ['c', 'cpp'] }                " cpp omni completion engine
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }                       " additional vim syntax highlighting
Plug 'vim-scripts/DoxygenToolkit.vim',   { 'for': 'cpp' }                       " doxygen documentation

Plug 'justmao945/vim-clang',             { 'for': ['cpp','c'] }                 " clang completion plugin for vim
Plug 'Rip-Rip/clang_complete',
            \ {
            \ 'do': function('MakeInstall'),
            \ 'for': ['c', 'cpp']
            \ }                                                                 " clang based auto complete

Plug 'derekwyatt/vim-protodef',          { 'for': ['c', 'cpp'] }                " pull c++ function prototypes
Plug 'derekwyatt/vim-fswitch',           { 'for': ['c', 'cpp'] }                " switch between companion source files
Plug 'vim-jp/vim-cpp',                   { 'for': [ 'c', 'cpp'] }               " c/c++ syntax files
Plug 'osyo-manga/vim-marching',          { 'for': 'cpp' }                       " async clang code completion
Plug 'osyo-manga/vim-reunions',          { 'for': 'cpp' }                       " dependency for vim-marching

Plug 'wolfgangmehner/c-support'                                                 " same as c.vim but updated

"Plug 'wolfgangmehner/c-support',        { 'for': [ 'c', 'cpp'] }              " same as c.vim but updated
"Plug 'myint/clang-complete',            { 'for': ['cpp','c']}                  " using fork for python3 support
"Plug 'vim-scripts/c.vim',               { 'for': ['c','cpp'] }                 " c/cpp ide

Plug 'zchee/deoplete-clang',             { 'for': ['c', 'cpp'] }                " clang completion for deoplete

" }}}


" --- TeX file editing {{{
Plug 'lervag/vimtex'                                                            " editing LaTeX files
" }}}


" --- CtrlP Family plugins and extensions {{{
Plug 'ctrlpvim/ctrlp.vim'                                                       " fuzzy file, buffer, mru, tag etc
Plug 'tacahiroy/ctrlp-funky'                                                    " function navigator for ctrlp
Plug 'voronkovich/ctrlp-nerdtree.vim', { 'on': 'CtrlPNerdTree' }                " ctrlp for opening nerdtree
Plug 'sgur/ctrlp-extensions.vim',      { 'on': [
            \ 'CtrlPCmdline',
            \ 'CtrlPMenu',
            \ 'CtrlPYankring']
            \ }                                                                 " extensions for ctrlp
Plug 'pielgrzym/ctrlp-sessions',       { 'on': ['CtrlPSessions', 'MkS'] }       " vim sessions with ctrlp
Plug 'vim-ctrlspace/vim-ctrlspace'                                              " tabs/buffers/file management
Plug 'mattn/ctrlp-launcher',           { 'on': 'CtrlPLauncher' }                " ctrlp launcher extension
Plug 'h14i/vim-ctrlp-buftab',          { 'on': 'CtrlPBufTab' }                  " ctrlp buffer tab
Plug 'mattn/ctrlp-windowselector',     { 'on': 'CtrlPWindowSelector' }          " ctrlp window
Plug 'fisadev/vim-ctrlp-cmdpalette',   { 'on': 'CtrlPCmdPalette' }              " ctrlp cmd palette extension
Plug 'elentok/ctrlp-objects.vim',      { 'on': [
            \ 'CtrlPModels',
            \ 'CtrlPViews',
            \ 'CtrlPControllers',
            \ 'CtrlPTemplates',
            \ 'CtrlPPresenters' ]
            \ }
Plug 'jasoncodes/ctrlp-modified.vim'                                            " easily open locally modified files on git
Plug 'nmanandhar/vim-ctrlp-menu'                                                " adding custom menus of commands

" install only if vim has been compiled with python support
if has('python')
    Plug 'felikz/ctrlp-py-matcher'                                              " fast ctrlp matcher based on python
endif
" }}}


" --- Miscellaneous & general utilities {{{
Plug 'ujihisa/repl.vim'                                                " repl for langs
Plug 'brookhong/k.vim'                                                 " run external commands
Plug 'matze/vim-move'                                                  " move lines and selections
Plug 'edkolev/promptline.vim'                                          " promptline
Plug 'tyru/current-func-info.vim'                                      " get current function name
Plug 'jiangmiao/auto-pairs'                                            " parenthesis auto parentheses pairing
Plug 'tpope/vim-repeat'                                                " vim repeat the last command on
Plug 'tpope/vim-surround'                                              " parenthesizing made simple
Plug 'gorkunov/smartpairs.vim'                                         " fantastic selection for vim
Plug 'beloglazov/vim-online-thesaurus', { 'on': 'OnlineThesaurusCurrentWord' }
"Plug 'Raimondi/delimitMate'                                           " auto quotes, parens, brackets, etc
                                                                       " word lookup in online thesaurus (-K)
Plug 'thinca/vim-ref'                                                  " integrated reference viewer
Plug 'jceb/vim-hier'                                                   " hl quickfix errors
Plug 'mattesgroeger/vim-bookmarks'                                     " vim bookmarks
Plug 'docunext/closetag.vim'                                           " close open HTML/XML tags
Plug 'ujihisa/neco-look'                                               " look completion for english

"Plug 'tomtom/quickfixsigns_vim'                                       " mark quickfix and location list items

Plug 'tpope/vim-unimpaired'                                            " pairs of handy bracket mappings

Plug 'dkarter/bullets.vim'                                             " automated bullet list

Plug 'bhurlow/vim-parinfer'                                            " balance your parenthesis

"     vim-fireplace dependencies
Plug 'tpope/vim-classpath'                                             " vim classpath
"Plug 'guns/vim-sexp', { 'for': ['clojure'] }                          " vim expression support
"Plug 'jpalardy/vim-slime'                                             " slime for vim
"Plug 'editorconfig/editorconfig-vim'                                  " editorconfg

Plug 'skywind3000/asyncrun.vim'                                        " run async commands
" }}}


" --- Plugins for multiple text selection {{{
Plug 'terryma/vim-multiple-cursors'                                             " vim multiple cursors
"Plug 'hlissner/vim-multiedit'                                                  " multiple cursors
" }}}


" --- Plugins for text visualization {{{
Plug 'osyo-manga/vim-brightest'                                                 " highlight cursor word
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }                         " preview in commandline window
Plug 't9md/vim-quickhl'                                                         " highlight selected word
Plug 'valloric/vim-operator-highlight'                                          " highlight operator characters
Plug 'osyo-manga/vim-over'                                                      " :substitute preview
" }}}


" --- elixir auto-complete syntax checking and development {{{
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }                 " vim for elixir
Plug 'slashmili/alchemist.vim', { 'for': ['elixir', 'eelixir'] }                " elixir integration for vim
" }}}


" --- for documentation purposes and writing {{{
Plug 'vim-pandoc/vim-pandoc'                                                    " pandoc integration and utilities
Plug 'vim-pandoc/vim-pandoc-syntax'                                             " pandoc markdown syntax
Plug 'jceb/vim-orgmode'                                                         " org mode for vim
Plug 'tpope/vim-speeddating'                                                    " for handling dates in vim
"Plug 'xolox/vim-notes' | Plug 'xolox/vim-misc'                                  " easy note taking
" }}}


" --- for python/python3 language auto-completion {{{
" --- syntax checking, highlighting and more
Plug 'vim-scripts/python.vim--Vasiliev', { 'for': [ 'python', 'python3' ] }     " enhanced python syntax highlighting
Plug 'davidhalter/jedi-vim', { 'for': [ 'python', 'python3' ] }                 " python jedi auto-completion (the best)
Plug 'Vimjas/vim-python-pep8-indent', { 'for': [ 'python', 'python3' ] }        " python indentation style for vim
Plug 'tell-k/vim-autopep8', { 'for': [ 'python', 'python3' ] }                  " autopep8 plugin for python
Plug 'ehamberg/vim-cute-python', { 'for': [ 'python', 'python3' ] }             " conceal for python
Plug 'tweekmonster/impsort.vim', { 'for': [ 'python', 'python3' ] }             " sort and highlight py imports
Plug 'klen/python-mode',
            \ {
            \ 'do': function('GitRecurse'),
            \ 'for': [ 'python', 'python3' ]
            \ }                                                                 " python-mode,pylint,rope,pydoc
Plug 'plytophogy/vim-virtualenv', { 'for': [ 'python', 'python3' ] }            " for working with virtualenvs
Plug 'python-rope/ropevim', { 'for': [ 'python', 'python3' ] }                  " rope python code assist
"Plug 'lambdalisue/vim-pyenv'                                                   " python virtual env (if required)
" }}}

" --- PlantUml diagrams {{{
Plug 'aklt/plantuml-syntax'                                                     " vim syntax for plantuml
Plug 'scrooloose/vim-slumlord'                                                  " in-line preview for plantuml diagrams
"}}}


" --- YouCompleteMe being used only in gui mode for MacVim {{{
if has('gui_running')
    Plug 'valloric/youcompleteme',
                \ {
                \ 'do': function('YCMBuilder'),
                \ 'for': [ 'c', 'cpp', 'go', 'javascript', 'erlang', 'python', 'haskell' ]
                \ }
endif
" }}}


" --- code completion and commenting framework(s) section {{{

"if has('python')
"    " this does not go along well with ycm which is only
"    " in the gui mode, so disabling it in the gui mode
"    " also it's based on python
"    Plug 'maralla/completor.vim'                                               " async completion framework
"endif

" }}}

" ############################### Plugins sections ends ##############################
" vim: tabstop=4 shiftwidth=4 softtabstop=4 expandtab
