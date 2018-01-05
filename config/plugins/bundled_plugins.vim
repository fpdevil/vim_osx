" ╔═══════════════════════════════════════════════════════════════════════════════════╗
" ║ $$             All Vim plugins installed through Vim Plugin Manager            $$ ║
" ╚═══════════════════════════════════════════════════════════════════════════════════╝

scriptencoding utf-8

"         list of all the plugins to be installed through vimplug
"          thanks to https://github.com/junegunn/vim-plug

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

function! InstallJsHint(info)
    if a:info.status == 'installed' || a:info.force
        !npm install -g jshint
    endif
endfunction

function! BuildTern(info)
    if a:info.status == 'installed' || a:info.force
        !npm install
        !npm install -g tern
    endif
endfunction

function! GetImport(info)
    if a:info.status == 'installed' || a:info.force
        !npm install
        !npm install -g import-js
    endif
endfunction

" function for handling the YouCompleteMe post build and installation
function! YCMBuilder(info)
    " info dictionary structure has following 3 fields
    " -- name: name of plugin
    " -- status: 'installed', 'updated', 'unchanged'
    " -- force: set with PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
        let $EXTRA_CMAKE_ARGS='-DEXTERNAL_LIBCLANG_PATH'
                    \ . '='
                    \ . '/opt/software/clang+llvm-3.9.0-x86_64-apple-darwin/lib/libclang.dylib'
                    "\ . '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
        !python3 install.py --clang-completer --system-libclang --gocode-completer --tern-completer
        !cd ./third_party/tern_runtime && npm install
    endif
endfunction


" --- syntax checkers section {{{
Plug 'scrooloose/syntastic', { 'do': function('InstallJsHint') }                " realtime syntax checker
Plug 'Chiel92/vim-autoformat'                                                   " easy code formatting in vim
Plug 'Shougo/neocomplete.vim'                                                   " neocompletion with cache (need lua support)
Plug 'Shougo/neoinclude.vim'                                                    " include completion framework for neocomplete
" }}}


" --- utilities section {{{
"     for vimproc you have to go to .vim/plugin/vimproc.vim and run a ./make
Plug 'Shougo/vimproc.vim', { 'do': 'make -j4' }                                 " vimproc asynchronous
Plug 'benizi/vim-automkdir'                                                     " create dir as required
Plug 'bronson/vim-trailing-whitespace'                                          " remove trailing white spaces
Plug 'mhinz/vim-startify'                                                       " fancy start screen for vim
Plug 'easymotion/vim-easymotion'                                                " vim motions on speed
Plug 'Yggdroot/indentLine'                                                      " display the indention levels
Plug 'itchyny/calendar.vim'                                                     " calendar application
Plug 'xolox/vim-colorscheme-switcher'                                           " color scheme switcher
Plug 'tpope/vim-sleuth'                                                         " heuristically set buffer options
Plug 'Shougo/context_filetype.vim'                                              " context ft library for vim
Plug 'conradirwin/vim-bracketed-paste'                                          " handle auto set paste
" }}}

"{{{ --- vim code commenting
Plug 'scrooloose/nerdcommenter'                                                 " intensely orgasmic commenting
Plug 'tomtom/tcomment_vim'                                                      " line comment default toggle `gc`

"}}}

"{{{ --- finding tools
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }      " helps to grep

"}}}

" --- shell/terminal utilities for vim {{{
Plug 'shougo/vimshell.vim'                                                      " shell in vim
Plug 'mattn/vim-terminal'                                                       " terminal for vim
" }}}


" --- 3rd party color themes section {{{
Plug 'flazz/vim-colorschemes'                                                   " Color Schemes
Plug 'morhetz/gruvbox'                                                          " Retro groove color scheme
Plug 'trusktr/seti.vim'                                                         " seti colorscheme
Plug 'altercation/vim-colors-solarized'                                         " solarized color schemes
Plug 'baeuml/summerfruit256.vim'                                                " 256 color scheme
Plug 'jacoborus/tender.vim'                                                     " 24bit colorscheme for Vim, Airline
Plug 'kabbamine/yowish.vim'                                                     " dark & yellowish colorscheme
Plug 'tyrannicaltoucan/vim-quantum'                                             " material color scheme
" }}}


" --- plugins for vim textual snippets supporting code auto completion {{{
Plug 'tomtom/tlib_vim'                                                          " for snippets
Plug 'SirVer/ultisnips'                                                         " for snippets
Plug 'honza/vim-snippets'                                                       " vim-snippets depends on ultisnippets
Plug 'MarcWeber/vim-addon-mw-utils'                                             " for snippets
Plug 'garbas/vim-snipmate'                                                      " for snippets
Plug 'shougo/neosnippet.vim'                                                    " ne snippet plugin
Plug 'shougo/neosnippet-snippets'                                               " neo snippets
" }}}


" --- vim distraction free typing {{{
Plug 'junegunn/goyo.vim'                                                        " distraction-free writing in Vim
Plug 'junegunn/limelight.vim'                                                   " light theme for goyo
" }}}


" --- unite family plugins and extensions {{{
Plug 'Shougo/unite.vim'                                                         " unite color changer helper
Plug 'shougo/denite.nvim'                                                       " nexgen unite
Plug 'Shougo/unite-outline'                                                     " outline source for unite
Plug 'ujihisa/unite-colorscheme'                                                " Unite color scheme browser
Plug 'Shougo/neomru.vim'                                                        " includes unite.vim MRU sources
Plug 'mattn/unite-vim_advent-calendar'                                          " unite source for calendar
Plug 'mattn/webapi-vim'                                                         " vim interface to web api
Plug 'mattn/wwwrenderer-vim'                                                    " vim renderer
Plug 'thinca/vim-openbuf'                                                       " open and manage buffers
Plug 'choplin/unite-vim_hacks'                                                  " this needs above 3 plugins
Plug 'osyo-manga/unite-option'                                                  " output vim options
" }}}


" --- Fuzzy Finder for vim {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
" }}}


" --- File Exploring section {{{
Plug 'shougo/vimfiler.vim'                                                      " file explorer
Plug 'scrooloose/nerdtree' , { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }       " NERDTree file browser, Undo list
Plug 'jistr/vim-nerdtree-tabs'                                                  " NERDTree and tabs together
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }                              " undo history visualizer
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
"Plug 'tenfyzhong/CompleteParameter.vim'                                         " param completion after select
Plug 'nathanaelkane/vim-indent-guides'                                          " vim indentation display
" }}}


" --- vim source for neocomplete {{{
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'mhinz/vim-lookup', { 'for': 'vim' }                                       " jump to vim code definitions
" }}}


" --- haskell languauge {{{
"     auto-complete, syntax and code checking sections
"     load these plugins only while opening haskell code or source
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }                          " syntax indentation / highlight
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }                      " for concealing haskell operators
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }                                " ghcmod for haskell in vim
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }                                  " ghc haskell
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }                                " Hoogle haskell search
Plug 'pbrisbin/html-template-syntax', { 'for': 'haskell' }                      " Yesod templates
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }                                 " HDevTools for Haskell
Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }                       " Stylish Haskell
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }                      " Hlint refactor
Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell'}                          " haskell indent plugin
Plug 'dan-t/vim-hsimport', {'for': 'haskell'}                                   " plugin for hsimport
Plug 'adinapoli/cumino', { 'for': 'haskell' }                                   " vim ghci tmux integration
Plug 'alx741/vim-stylishask'                                                    " stylish haskell integration
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
Plug 'jaxbot/semantic-highlight.vim'                                            " semantic highlighting
Plug 'rakr/vim-two-firewatch'                                                   " duotone light and firewatch for atom
"Plug 'bling/vim-bufferline'                                                    " show number of buffers
"Plug 'bling/vim-airline'                                                       " using vim-airline repo
" }}}


" --- clojure language {{{
"     specific auto-completion, syntax and formatting sections
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }                            " clojure support
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }                               " clojure formatting tool
Plug 'venantius/vim-eastwood', { 'for': 'clojure'}                              " clojure lint tool
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }                                " clojure support
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }                       " clojure and scheme support
" }}}


" --- GO language section {{{
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'tweekmonster/hl-goimport.vim', { 'for': 'go' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" }}}


" --- javascript syntax check and auto-completions section {{{
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }                          " beautify js
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }                         " js for vim
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }    " pretty hl for js[x]
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }                    " enhanced js syntax
Plug 'othree/yajs.vim', { 'for': 'javascript' }                                 " yet another js
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }                       " syntax for ECMA

Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }             " js param complete
Plug 'einars/js-beautify', {
            \ 'do': 'git submodule update --init --recursive',
            \ 'for': 'javascript'
            \ }

"    extended syntax for js with jQuery,backbone,etc
Plug 'mxw/vim-jsx'                                                              " json/js support
Plug 'elzr/vim-json'                                                            " json highlighting
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
            \ 'for': ['javascript', 'javascript.vim']}                          " import js
Plug 'shutnik/jshint2.vim', { 'for': 'javascript' }                             " JSHint integration
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }                           " Generate JSDoc to your JavaScript code
Plug 'moll/vim-node', { 'for': 'javascript' }                                   " Tools & Env for node.js
Plug 'myhere/vim-nodejs-complete', { 'for': 'javascript' }                      " nodejs omnifunc
Plug 'mattn/jscomplete-vim', { 'for': 'javascript' }                            " vim omnifunc for JavaScript
"Plug 'bigfish/vim-js-context-coloring', { 'for': 'javascript' }                " js highlight, context & coloring

Plug 'jbgutierrez/vim-babel'                                                    " wrapper around babel.js
Plug 'mattn/webapi-vim'                                                         " vim interface to Web API
" }}}


" erlang language auto-completions, syntax check and support section {{{
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }                       " erlang indentation, syntax
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }                  " erlang code auto completion
Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }                      " erlang syntax checker, compiler
Plug 'oscarh/vimerl', { 'for': 'erlang' }                                       " erlang plugins
Plug 'youthy/vimerl-complete'                                                   " erlang auto complete
Plug 'vim-erlang/vim-erlang-skeletons', { 'for': 'erlang' }                     " erlang templates
Plug 'akalyaev/vim-erlang-spec', { 'for': 'erlang' }                            " erlang generate specifications
Plug 'vim-erlang/vim-erlang-tags'                                               " erlang tag generate for vim
Plug 'vim-erlang/erlang-motions.vim', { 'for': 'erlang' }                       " erlang motions and text objects
Plug 'ppikula/vim-wrangler'                                                     " vim wrangler plugin
" }}}


" --- allow pane movement to jump out of vim into tmux navigator {{{
Plug 'christoomey/vim-tmux-navigator'                                           " terminal multiplex
" }}}

" --- display all the leader mappings with descriptions {{{
Plug 'ktonga/vim-follow-my-lead'
Plug 'hecal3/vim-leader-guide'                                                  " vim keymap-display
Plug 'jimmay5469/vim-spacemacs'                                                 " spacemacs key bindings
" }}}

" --- scala language auto-complete, syntax and support {{{
Plug 'derekwyatt/vim-scala', { 'for': 'scala'}                                  " scala support
"Plug 'ensime/ensime-vim'                                                       " ensime for scala auto-complete
"Plug 'megaannum/vimside'                                                       " vim scala ide
" }}}

" --- for html, xml ... syntax, validation etc. {{{
Plug 'mattn/emmet-vim'                                                          " emmet for vim
Plug 'othree/html5.vim'                                                         " html5 support
Plug 'othree/xml.vim'                                                           " xml support
Plug 'sukima/xmledit'                                                           " xml editor
Plug 'vim-scripts/xslt'                                                         " xslt ftplugin
Plug 'Valloric/MatchTagAlways'                                                  " highlight matching tags on markup's
Plug 'gko/vim-coloresque'                                                       " color preview #rrggbb or #rgb
"Plug 'lilydjwg/colorizer'                                                      " text colorizer #rrggbb or #rgb
" }}}

" --- for c/c++ language support (load on demand only) {{{
Plug 'vim-scripts/OmniCppComplete'                                              " cpp omni completion engine
Plug 'justmao945/vim-clang', { 'for': ['cpp','c'] }                             " clang completion plugin for vim
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }                       " additional vim syntax highlighting
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': 'cpp' }                         " doxygen documentation
"Plug 'myint/clang-complete', { 'for': ['cpp','c']}                             " using fork for python3 support
Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp'] }                          " clang based auto complete
Plug 'osyo-manga/vim-marching'                                                  " async clang code completion
Plug 'rhysd/vim-clang-format', { 'on': 'ClangFormat' }                          " a formatter for C, C++, Obj-C, Java, JS and TypeScript
Plug 'derekwyatt/vim-protodef', { 'for': 'cpp' }                                " pull c++ function prototypes
Plug 'vim-jp/vim-cpp', { 'for': [ 'c', 'cpp' ] }                                " c/c++ syntax files
Plug 'wolfgangmehner/c-support'                                                 " same as above but updated
"Plug 'vim-scripts/c.vim', { 'for': ['c','cpp'] }                               " c/cpp ide
" }}}


" --- TeX file editing {{{
Plug 'lervag/vimtex'                                                            " editing LaTeX files
" }}}


" --- CtrlP Family plugins and extensions {{{
Plug 'ctrlpvim/ctrlp.vim'                                                       " fuzzy file, buffer, mru, tag etc
Plug 'tacahiroy/ctrlp-funky'                                                    " function navigator for ctrlp
Plug 'voronkovich/ctrlp-nerdtree.vim'                                           " ctrlp for opening nerdtree
Plug 'sgur/ctrlp-extensions.vim', { 'on': [
            \ 'CtrlPCmdline',
            \ 'CtrlPMenu',
            \ 'CtrlPYankring']
            \ }                                                                 " extensions for ctrlp
Plug 'pielgrzym/ctrlp-sessions', { 'on': ['CtrlPSessions', 'MkS'] }             " vim sessions with ctrlp
Plug 'vim-ctrlspace/vim-ctrlspace'                                              " tabs/buffers/file management
Plug 'mattn/ctrlp-launcher', { 'on': 'CtrlPLauncher' }                          " ctrlp launcher extension
Plug 'felikz/ctrlp-py-matcher'                                                  " fast ctrlp matcher based on python
Plug 'h14i/vim-ctrlp-buftab', { 'on': 'CtrlPBufTab' }                           " ctrlp buffer tab
Plug 'mattn/ctrlp-windowselector', { 'on': 'CtrlPWindowSelector' }              " ctrlp window
Plug 'fisadev/vim-ctrlp-cmdpalette', { 'on': 'CtrlPCmdPalette' }                " ctrlp cmd palette extension
Plug 'elentok/ctrlp-objects.vim', { 'on': [
            \ 'CtrlPModels',
            \ 'CtrlPViews',
            \ 'CtrlPControllers',
            \ 'CtrlPTemplates',
            \ 'CtrlPPresenters' ]
            \ }
" }}}


" --- miscellaneous general utilities {{{
Plug 'brookhong/k.vim'                                                          " run external commands
Plug 'matze/vim-move'                                                           " move lines and selections
Plug 'edkolev/promptline.vim'                                                   " promptline
Plug 'tyru/current-func-info.vim'                                               " get current function name
Plug 'jiangmiao/auto-pairs'                                                     " parenthesis auto parentheses pairing
Plug 'Raimondi/delimitMate'                                                     " auto quotes, parens, brackets, etc
Plug 'guns/vim-sexp'                                                            " vim expression support
Plug 'tpope/vim-repeat'                                                         " vim repeat the last command on
Plug 'tpope/vim-surround'                                                       " parenthesizing made simple
Plug 'tpope/vim-unimpaired'                                                     " pairs of handy bracket mappings
Plug 'gorkunov/smartpairs.vim'                                                  " fantastic selection for vim
Plug 'beloglazov/vim-online-thesaurus'                                          " word lookup in online thesaurus (-K)
Plug 'thinca/vim-ref'                                                           " integrated reference viewer
Plug 'jceb/vim-hier'                                                            " hl quickfix errors
Plug 'mattesgroeger/vim-bookmarks'                                              " vim bookmarks
Plug 'jakedouglas/exuberant-ctags'                                              " ctags for multiple langs
"     vim-fireplace dependencies
"Plug 'tpope/vim-classpath'                                                     " vim classpath
"Plug 'jpalardy/vim-slime'                                                      " slime for vim
"Plug 'editorconfig/editorconfig-vim'                                            " editorconfg
" }}}


" --- Plugins for multiple text selection {{{
Plug 'terryma/vim-multiple-cursors'                                             " vim multiple cursors
" }}}


" --- Plugins for text visualization {{{
Plug 'osyo-manga/vim-brightest'                                                 " highlight cursor word
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }                         " preview in commandline window
Plug 't9md/vim-quickhl'                                                         " highlight selected word
Plug 'valloric/vim-operator-highlight'                                          " highlight operator characters
" }}}


" --- elixir auto-complete syntax checking and development {{{
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }                 " vim for elixir
Plug 'slashmili/alchemist.vim', { 'for': ['elixir', 'eelixir'] }                " elixir integration for vim
" }}}


" --- for documentation purposes and writing {{{
Plug 'vim-pandoc/vim-pandoc'                                                    " pandoc integration and utilities
Plug 'vim-pandoc/vim-pandoc-syntax'                                             " pandoc markdown syntax
Plug 'xolox/vim-notes' | Plug 'xolox/vim-misc'                                  " easy note taking
" }}}


" --- for python/python3 language auto-completion {{{
" --- syntax checking, highlighting and more
Plug 'vim-scripts/python.vim--Vasiliev'                                         " enhanced python syntax highlighting
Plug 'davidhalter/jedi-vim'                                                     " python jedi auto-completion (the best)
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }                       " python indentation style for vim
Plug 'tell-k/vim-autopep8', { 'for': 'python' }                                 " autopep8 plugin for python
Plug 'python-rope/ropevim'                                                      " rope for python code assist
"Plug 'lambdalisue/vim-pyenv'                                                   " python virtual env (if required)
" }}}


" --- Asynchronous Lint Engine (using only syntastic for now) {{{
" Plug 'w0rp/ale'
" }}}


" --- YouCompleteMe being used only in gui mode for MacVim {{{
if has("gui_running")
    Plug 'valloric/youcompleteme',
                \ { 'do': function('YCMBuilder'),
                \ 'for': [ 'c', 'cpp', 'go', 'javascript', 'erlang', 'python', 'haskell' ]
                \ }
endif
" }}}


" --- code completion and commenting framework(s) section {{{
if !has('gui_running')
    " this does not go along well with ycm which is only
    " in the gui mode, so disabling it in the gui mode
    "Plug 'maralla/completor.vim'                                               " async completion framework
endif
" }}}

" ############################### Plugins sections ends ##############################