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
                    \ . '/opt/software/clang+llvm-7.0.0-x86_64-apple-darwin/lib/libclang.dylib'
                    "\ . '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
        !python3 install.py --clang-completer --system-libclang --gocode-completer --tern-completer
        !cd ./third_party/ycmd/third_party/tern_runtime && npm install
    endif
endfunction


" ==== Core dependent plugin ====
"      for vimproc you have to go to .vim/plugin/vimproc.vim and run a ./make
Plug 'Shougo/vimproc.vim', { 'do': 'make -j4' }                        " vimproc asynchronous


" ==== Plugins for syntax checking ====
if exists('g:vim_syntax_ale') && g:vim_syntax_ale
    " --- Asynchronous Lint Engine
    Plug 'w0rp/ale'
else
    " --- Syntastic realtime syntax checker
    Plug 'scrooloose/syntastic'
endif

" ==== plugins for auto-completion, code formatters and commenting ====
" neocompletion with cache (need lua support)
if exists('g:vim_auto_complete_engine') && g:vim_auto_complete_engine ==# 'neocomplete'
    Plug 'Shougo/neocomplete.vim'
endif
" deoplete will replace neocomplete some time
if exists('g:vim_auto_complete_engine') && g:vim_auto_complete_engine ==# 'deoplete'
    Plug 'Shougo/deoplete.nvim'                         " dark powered neo-completion
    Plug 'roxma/nvim-yarp'                              " Yet Another Remote Plugin Framework
    Plug 'roxma/vim-hug-neovim-rpc'                     " neovim rpc client fpr vim8
endif
Plug 'Shougo/neoinclude.vim'                            " include completion framework for neocomplete
Plug 'Chiel92/vim-autoformat'                           " easy code formatting in vim
Plug 'scrooloose/nerdcommenter'                         " intensely orgasmic commenting


" ==== plugins supporting various utilities ====
Plug 'bronson/vim-trailing-whitespace', { 'on': 'FixWhitespace' }      " remove trailing white spaces
Plug 'mhinz/vim-startify'                                              " fancy start screen for vim
Plug 'benizi/vim-automkdir'                                            " create dir as required
Plug 'easymotion/vim-easymotion'                                       " vim motions on speed
Plug 'Yggdroot/indentLine'                                             " display the indention levels
Plug 'itchyny/calendar.vim'                                            " calendar application
Plug 'tpope/vim-sleuth'                                                " heuristically set buffer options
Plug 'tpope/vim-dispatch'                                              " async build and test dispatcher
Plug 'conradirwin/vim-bracketed-paste'                                 " handle auto set paste
Plug 'shougo/echodoc', { 'on': ['EchoDocEnable', 'EchoDocDisable'] }   " print documents in echo area
Plug 'Shougo/context_filetype.vim'                                     " context ft library for vim
Plug 'schickling/vim-bufonly', { 'on': ['BufOnly', 'Bonly'] }          " delete all buffers except current
Plug 'rhysd/vim-healthcheck'                                           " polyfill of nvim's healthcheck



" ==== Fuzzy Finder, grep and other finding tools for vim ====
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'


" ==== shell/terminal utilities for vim ====
Plug 'shougo/vimshell.vim'                                      " shell in vim
Plug 'rbtnn/vimconsole.vim', { 'on': [
            \ 'VimConsoleLog', 'VimConsoleOpen', 'VimConsoleWarn', 'VimConsoleError',
            \ 'VimConsoleError', 'VimConsoleToggle', 'VimConsoleClear', 'VimConsoleRedraw',
            \ ],
            \ }                                                 " immediate-window for Vim script


" ==== plugins for 3rd party color themes ====
Plug 'flazz/vim-colorschemes'        " Color Schemes
Plug 'morhetz/gruvbox'               " Retro groove color scheme
Plug 'trusktr/seti.vim'              " seti colorscheme
Plug 'lifepillar/vim-solarized8'     " optimized solarixed scheme
Plug 'baeuml/summerfruit256.vim'     " 256 color scheme
Plug 'jacoborus/tender.vim'          " 24bit colorscheme for Vim, Airline
Plug 'kabbamine/yowish.vim'          " dark & yellowish colorscheme
Plug 'tyrannicaltoucan/vim-quantum'  " material color scheme
Plug 'lifepillar/vim-wwdc16-theme'   " dark scheme based on Apple WWDC16
Plug 'lifepillar/vim-wwdc17-theme'   " light scheme based on Apple WWDC17
Plug 'yuttie/hydrangea-vim'
Plug 'yuttie/inkstained-vim'
Plug 'iCyMind/NeoSolarized'          " solarized for better truecolor support
Plug 'ayu-theme/ayu-vim'


" ==== plugins for vim textual snippets supporting code auto completion ====
Plug 'SirVer/ultisnips'                                      " for snippets
Plug 'MarcWeber/vim-addon-mw-utils'                          " for snippets
Plug 'tomtom/tlib_vim'                                       " snipmate dependency
Plug 'garbas/vim-snipmate'                                   " for snippets
Plug 'honza/vim-snippets'                                    " vim-snippets depends on ultisnippets
Plug 'shougo/neosnippet-snippets'                            " neo snippets repository
Plug 'shougo/neosnippet.vim'                                 " neo snippet plugin
Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }  " react js snippets


" ==== plugins for unite family and related extensions ====
Plug 'Shougo/unite.vim'                    " unite color changer helper
Plug 'Shougo/unite-outline'                " outline source for unite
Plug 'ujihisa/unite-colorscheme'           " Unite color scheme browser
Plug 'Shougo/neomru.vim'                   " includes unite.vim MRU sources
Plug 'mattn/unite-vim_advent-calendar'     " unite source for calendar
Plug 'mattn/webapi-vim'                    " vim interface to web api
Plug 'mattn/wwwrenderer-vim'               " vim renderer
Plug 'thinca/vim-openbuf'                  " open and manage buffers
Plug 'choplin/unite-vim_hacks'             " this needs above 3 plugins
Plug 'osyo-manga/unite-option'             " output vim options
Plug 'tsukkee/unite-help'                  " help source for unite.vim
Plug 'osyo-manga/unite-quickfix'           " outputs from quickfix
Plug 'zhaocai/unite-scriptnames'           " extension for runtime scriptnames


" ==== plugins for File Exploring ====
Plug 'shougo/vimfiler.vim'                                                 " file explorer
Plug 'xuyuanp/nerdtree-git-plugin'                                         " NERDTree git status display
Plug 'jistr/vim-nerdtree-tabs'                                             " NERDTree and tabs together
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }                         " undo history visualizer
Plug 'scrooloose/nerdtree' , { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }  " NERDTree file browser, Undo list
augroup nerd_tree_load
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_tree_load'
        \| endif
augroup END


" ==== plugins for source code control, git integration etc., ====
Plug 'tpope/vim-fugitive'           " git integration
Plug 'airblade/vim-gitgutter'       " show which line changed using git
Plug 'mhinz/vim-signify'            " show diff via vim sign column


" ==== plugins for Text/Code alignment/completion and manipulation plugins ====
Plug 'ervandew/supertab'                              " use TAB for all insertions
Plug 'junegunn/vim-easy-align', { 'on':
            \ ['<Plug>(EasyAlign)', 'EasyAlign']  }   " text and code alignment
Plug 'godlygeek/tabular'                              " text filtering and alignment
Plug 'Shougo/neco-syntax'                             " syntax source for neocomplete
Plug 'ujihisa/neco-look'                              " english lookup for neo
Plug 'nathanaelkane/vim-indent-guides'                " vim indentation display


" plugins for vim neocomplete source ====
Plug 'Shougo/neco-vim' , { 'for': 'vim' }
Plug 'mhinz/vim-lookup', { 'for': 'vim' }



" ==== plugins for haskell languauge support and utilities ====
"      auto-complete, syntax and code checking sections
"      load these plugins only while opening haskell code or source
Plug 'eagletmt/neco-ghc'             ,{ 'for': 'haskell' }   " ghc haskell
Plug 'eagletmt/ghcmod-vim'           ,{ 'for': 'haskell' }   " ghcmod for haskell in vim
Plug 'enomsg/vim-haskellConcealPlus' ,{ 'for': 'haskell' }   " for concealing haskell operators
Plug 'neovimhaskell/haskell-vim'     ,{ 'for': 'haskell' }   " syntax indentation / highlight
Plug 'elliottt/vim-haskell'          ,{ 'for': 'haskell' }   " haskell support for vim
Plug 'Twinside/vim-hoogle'           ,{ 'for': 'haskell' }   " Hoogle haskell search
Plug 'osyo-manga/vim-hoogle-web'                             " search by hoogle web
Plug 'itchyny/vim-haskell-indent'    ,{ 'for': 'haskell' }   " haskell indent plugin
Plug 'dan-t/vim-hsimport'            ,{ 'for': 'haskell' }   " plugin for hsimport
Plug 'alx741/vim-hindent'            ,{ 'for': 'haskell' }   " hident integration
Plug 'mpickering/hlint-refactor-vim' ,{ 'for': 'haskell' }   " Hlint refactor
Plug 'pbrisbin/vim-syntax-shakespeare'                       " syntax for hl template langs
Plug 'pbrisbin/html-template-syntax'                         " Yesod templates
" ***** unused plugins *****
"Plug 'travitch/hasksyn', { 'for': ['haskell', 'cabal'] }
"Plug 'dag/vim2hs',{ 'for': 'haskell' }                      " vimscripts for haskell development
"Plug 'nbouscal/vim-stylish-haskell',{ 'for': 'haskell' }    " Stylish Haskell
"Plug 'alx741/vim-stylishask'                                " stylish haskell integration
"Plug 'adinapoli/cumino'  ,{ 'for': 'haskell' }              " vim ghci tmux integration
"Plug 'bitc/vim-hdevtools',{ 'for': 'haskell' }              " HDevTools for Haskell
"Plug 'philopon/hassistant.vim'


" ==== plugins for idris,agda and elm language syntax ====
Plug 'idris-hackers/idris-vim'           " idris language support
Plug 'rking/ag.vim'                      " AGDA language
Plug 'lambdatoast/elm.vim'               " elm scripting language


" ==== plugins for some eye candies like status bars and colors ====
Plug 'vim-airline/vim-airline'                        " Airline statusbar
Plug 'vim-airline/vim-airline-themes'                 " Airline themes
Plug 'osyo-manga/unite-airline_themes'                " preview airline themes
Plug 'majutsushi/tagbar'                              " tagbar support
Plug 'kien/rainbow_parentheses.vim'                   " rainbow parenthesis color brackets
Plug 'jaxbot/semantic-highlight.vim', { 'on' : [
            \ 'SemanticHighlight',
            \ 'SemanticHighlightRevert',
            \ 'SemanticHighlightToggle'
            \ ] }                                     " semantic highlighting
Plug 'rakr/vim-two-firewatch'                         " duotone light and firewatch for atom
" ***** unused plugins *****
"Plug 'bling/vim-bufferline'                          " show number of buffers
"Plug 'bling/vim-airline'                             " using vim-airline repo



" ==== plugins for clojure language ====
"      specific auto-completion, syntax and formatting sections
Plug 'thinca/vim-ft-clojure'     ,{ 'for': 'clojure' }     " ft plugin for clojure
Plug 'venantius/vim-eastwood'    ,{ 'for': 'clojure' }     " clojure lint tool
Plug 'kovisoft/paredit'          ,{ 'for': 'clojure' }     " clojure support
Plug 'tpope/vim-fireplace'       ,{ 'for': 'clojure' }     " clojure support
Plug 'guns/vim-clojure-highlight'                          " clojure syntax hl support
Plug 'guns/vim-clojure-static'                             " clojure synax hl support
Plug 'venantius/vim-cljfmt'                                " clojure formatting tool
" **** unused plugins ****
"Plug 'ujihisa/neoclojure.vim'    ,{ 'for': 'clojure' }    " clojure completion
"Plug 'clojure-vim/async-clj-omni' ,{ 'for': 'clojure' }   " async completion with deoplete
"Plug 'tpope/vim-salve'           ,{ 'on': [ 'Console' ] } " static support for Leiningen



" ==== plugins for Java language section ====
Plug 'artur-shaik/vim-javacomplete2',{ 'for': 'java' } " for java completion
Plug 'airblade/vim-rooter'          ,{ 'for': 'java' } " change to project directory


" ==== plugins for GO language ====
Plug 'fatih/vim-go'                 ,{ 'for': 'go', 'do': ':GoInstallBinaries', 'tag': '*' }
Plug 'tweekmonster/hl-goimport.vim' ,{ 'for': 'go' }
Plug 'mdempsky/gocode'              ,{ 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
"Plug 'nsf/gocode'                   ,{ 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }



" ==== plugins for javascript syntax check and auto-completions ====
Plug 'maksimr/vim-jsbeautify', {
            \ 'do' : function('InstallJsBeautify'),
            \ 'for': ['javascript', 'html'] }                   " beautify js
Plug 'maxmellon/vim-jsx-pretty'     , { 'for':
            \ ['javascript','javascript.jsx'] }                 " pretty hl for js[x]
Plug 'jelera/vim-javascript-syntax' , { 'for': 'javascript' }   " enhanced js syntax
Plug 'othree/yajs.vim'              , { 'for': 'javascript' }   " yet another js
Plug 'othree/es.next.syntax.vim'    , { 'for': 'javascript' }   " syntax for ECMA
Plug 'othree/jsdoc-syntax.vim'      , { 'for': 'javascript' }   " standalone jsdoc syntax
Plug 'heavenshell/vim-jsdoc'        , { 'for': 'javascript' }   " Generate JSDoc to your JavaScript code
Plug 'othree/jspc.vim', { 'for':
            \ ['javascript', 'javascript.jsx'] }                " js param complete
" ****    extended syntax for js with React,jQuery,backbone,etc ****
Plug 'mxw/vim-jsx'                                              " React JSX, indenting
Plug 'pangloss/vim-javascript',  { 'for':
            \ ['javascript', 'javascript.jsx'] }                " syntax highlighting
Plug 'neoclide/vim-jsx-improve', { 'for':
            \ ['javascript', 'javascript.jsx'] }                " syntax and indent
Plug 'elzr/vim-json'                                                    " json highlighting
Plug 'XadillaX/json-formatter.vim' ,{ 'do': 'npm install jjson -g' }    " format saved JSON file
Plug 'rhysd/vim-fixjson' ,{ 'do': 'npm install -g fixjson' }            " vim json fixer
Plug 'othree/javascript-libraries-syntax.vim', { 'for': [
            \ 'javascript',
            \ 'coffee',
            \ 'ls',
            \ 'typescript']
            \ }                                             " js syntax check and library support
Plug 'marijnh/tern_for_vim',{
            \ 'do': function('BuildTern'),
            \ 'for': ['javascript', 'javascript.jsx']}      " tern plugin for vim js
Plug 'galooshi/vim-import-js',{
            \ 'do': function('GetImport'),
            \ 'on': ['ImportJSWord', 'ImportJSFix',
            \ 'ImportJSGoto']}                              " import js
Plug 'shutnik/jshint2.vim',{
            \ 'do': function('InstallJsHint'),
            \ 'for': 'javascript' }                         " JSHint integration
Plug 'moll/vim-node' ,{ 'for': 'javascript' }               " Tools & Env for node.js
Plug 'mmalecki/vim-node.js' ,{ 'for': 'javascript' }        " ft detect for vim
Plug 'myhere/vim-nodejs-complete',{ 'for': 'javascript' }   " nodejs omnifunc
Plug 'mattn/jscomplete-vim',{ 'for': 'javascript' }         " vim omnifunc for JavaScript
Plug 'jbgutierrez/vim-babel'    " wrapper around babel.js
Plug 'mattn/webapi-vim'         " vim interface to Web API
Plug '1995eaton/vim-better-javascript-completion', { 'for': 'javascript' } " expansion of current js
Plug 'Quramy/tsuquyomi' , {
            \ 'do': function('InstallTS'),
            \ 'for': 'typescript' }                             " plugin for typescript
Plug 'leafgarland/typescript-vim'   , { 'for': 'typescript' }   " typescript syntax files
Plug 'Quramy/vim-js-pretty-template', { 'for': 'typescript' }   " highlight for ts
"Plug 'bigfish/vim-js-context-coloring',{ 'for': 'javascript' }  " js highlight, context & coloring


" ==== plugins for erlang language auto-completions, syntax check ====
Plug 'vim-erlang/vim-erlang-omnicomplete' ,{ 'for': 'erlang' } " erlang code auto completion
Plug 'vim-erlang/vim-erlang-runtime'      ,{ 'for': 'erlang' }  " erlang indentation and syntax
Plug 'vim-erlang/vim-erlang-compiler'     ,{ 'for': 'erlang' }  " erlang syntax checker and compiler
Plug 'vim-erlang/vim-erlang-skeletons'    ,{ 'for': 'erlang' }  " erlang templates
Plug 'vim-erlang/erlang-motions.vim'      ,{ 'for': 'erlang' }  " erlang motions and text objects
Plug 'vim-erlang/vim-erlang-tags'         ,{ 'for': 'erlang' }  " erlang tag generate for vim
Plug 'ehamberg/vim-cute-erlang'           ,{ 'for': 'erlang' }  " conceal for erlang
Plug 'melekes/vim-erlang-spec'            ,{ 'for': 'erlang' }  " erlang generate specifications
" **** unused plugins for erlang ****
"Plug 'youthy/vimerl-complete'                                 " erlang auto complete
"Plug 'oscarh/vimerl'                      ,{ 'for': 'erlang' } " erlang plugins
"Plug 'ppikula/vim-wrangler'                                    " vim wrangler plugin

" ==== Plugins for elixir auto-complete syntax checking and development ====
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }    " vim for elixir
Plug 'slashmili/alchemist.vim', { 'for': ['elixir', 'eelixir'] }   " elixir integration for vim


" ==== plugins for allowing pane movement to jump out of vim into tmux navigator ====
Plug 'christoomey/vim-tmux-navigator'     " terminal multiplex
Plug 'benmills/vimux'                     " interact with tmux


" ==== plugins to display all the leader mappings with descriptions ====
Plug 'ktonga/vim-follow-my-lead'   " vim leader key display
Plug 'hecal3/vim-leader-guide'     " vim keymap-display
" Plug 'jimmay5469/vim-spacemacs'  " spacemacs key bindings


" ==== plugins for scala language auto-complete, syntax etc,. ====
Plug 'derekwyatt/vim-scala', { 'for': 'scala'}   " scala support
"Plug 'ensime/ensime-vim'                        " ensime for scala auto-complete
"Plug 'megaannum/vimside'                        " vim scala ide


" ==== plugins for html,css,xml ... syntax, validation etc.====
Plug 'mattn/emmet-vim', { 'for':
            \ ['html', 'xhtml', 'css', 'xml', 'xls', 'markdown'] }    " emmet for vim
Plug 'othree/html5.vim', { 'for': ['html', 'xhttml', 'css'] }   " html5 support
Plug 'othree/xml.vim'                                           " xml support
Plug 'sukima/xmledit'                                           " xml editor
Plug 'vim-scripts/xslt'                                         " xslt ftplugin
Plug 'Valloric/MatchTagAlways'                                  " highlight matching tags on markup's
Plug 'gko/vim-coloresque'                                       " color preview #rrggbb or #rgb
if has('python') || has('python3')
    Plug 'Rykka/colorv.vim', {
                \ 'on': [
                \ 'ColorV', 'ColorVView', 'ColorVPreview',
                \ 'ColorVPicker', 'ColorVEdit', 'ColorVEditAll',
                \ 'ColorVInsert', 'ColorVList', 'ColorVName',
                \ 'ColorVScheme', 'ColorVSchemeFav',
                \ 'ColorVSchemeNew', 'ColorVTurn2'
                \ ]}
endif                                                        " color tool in vim


" ==== plugins for c/c++ language support (load on demand only) ====
if exists('g:vim_cpp_clang_completion') && g:vim_cpp_clang_completion
    " use either vim-clang or clang_complete
    Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp'] }
endif

if exists('g:vim_cpp_vim_clang') && g:vim_cpp_vim_clang
    " use either vim-clang or clang_complete
    Plug 'justmao945/vim-clang',   { 'for': ['cpp','c'] }
endif

if exists('g:vim_cpp_omni_completion') && g:vim_cpp_omni_completion
    " cpp omni completion engine
    Plug 'vim-scripts/OmniCppComplete', { 'for': ['c', 'cpp'] }
endif

if exists('g:vim_cpp_marching_completion') && g:vim_cpp_marching_completion
    " async clang code completion
    Plug 'osyo-manga/vim-marching', { 'for': 'cpp' }
endif

if exists('g:is_cpp_ide_enabled') && g:is_cpp_ide_enabled
    " same as c.vim but updated
    Plug 'wolfgangmehner/c-support'
endif

Plug 'rhysd/vim-clang-format',  { 'on': 'ClangFormat' }   " format c,c++,obj-c,java,js and ts
Plug 'osyo-manga/vim-reunions', { 'for': 'cpp' }          " dependency for vim-marching
Plug 'vim-jp/vim-cpp',          { 'for': [ 'c', 'cpp'] }  " c/c++ syntax files
Plug 'derekwyatt/vim-protodef', { 'for': ['c', 'cpp'] }   " pull c++ function prototypes
Plug 'derekwyatt/vim-fswitch',  { 'for': ['c', 'cpp'] }   " switch between companion source files
" **** doxygen documentation              ****
Plug 'vim-scripts/DoxygenToolkit.vim',   { 'for': 'cpp' }
" **** additional vim syntax highlighting ****
Plug 'osyo-manga/vim-cpp-syntax-reserved_identifiers', { 'for': 'cpp' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

" ==== deprecated plugins ====
"Plug 'myint/clang-complete',{ 'for': ['cpp','c']}   " using fork for python3 support
"Plug 'vim-scripts/c.vim',   { 'for': ['c','cpp'] }  " c/cpp ide



" ==== plugins for CtrlP Family and extensions ====
Plug 'ctrlpvim/ctrlp.vim'                                           " fuzzy file, buffer, mru, tag etc
Plug 'tacahiroy/ctrlp-funky'                                        " function navigator for ctrlp
Plug 'voronkovich/ctrlp-nerdtree.vim', { 'on': 'CtrlPNerdTree' }    " ctrlp for opening nerdtree
Plug 'sgur/ctrlp-extensions.vim',      { 'on': [
            \ 'CtrlPCmdline',
            \ 'CtrlPMenu',
            \ 'CtrlPYankring']
            \ }                                                        " extensions for ctrlp
Plug 'pielgrzym/ctrlp-sessions',    { 'on': ['CtrlPSessions', 'MkS'] } " vim sessions with ctrlp
Plug 'vim-ctrlspace/vim-ctrlspace'                                     " tabs/buffers/file management
Plug 'mattn/ctrlp-launcher',        { 'on': 'CtrlPLauncher' }          " ctrlp launcher extension
Plug 'h14i/vim-ctrlp-buftab',       { 'on': 'CtrlPBufTab' }            " ctrlp buffer tab
Plug 'mattn/ctrlp-windowselector',  { 'on': 'CtrlPWindowSelector' }    " ctrlp window
Plug 'fisadev/vim-ctrlp-cmdpalette',{ 'on': 'CtrlPCmdPalette' }        " ctrlp cmd palette extension
Plug 'elentok/ctrlp-objects.vim',   { 'on': [
            \ 'CtrlPModels',
            \ 'CtrlPViews',
            \ 'CtrlPControllers',
            \ 'CtrlPTemplates',
            \ 'CtrlPPresenters' ]
            \ }
Plug 'jasoncodes/ctrlp-modified.vim'         " easily open locally modified files on git
Plug 'nmanandhar/vim-ctrlp-menu'             " adding custom menus of commands
if has('python')
    " install only if vim has been compiled with python support
    Plug 'felikz/ctrlp-py-matcher'           " fast ctrlp matcher based on python
endif


" ==== plugins for parentheses management ====
Plug 'tpope/vim-surround'                " parenthesizing made simple
Plug 'tpope/vim-unimpaired'              " pairs of handy bracket mappings
Plug 'jiangmiao/auto-pairs'              " parenthesis auto parentheses pairing
Plug 'gorkunov/smartpairs.vim'           " fantastic selection for vim



" ==== plugins for various Miscellaneous & general utilities ====
Plug 'andymass/vim-matchup'              " matchup matching
Plug 'ujihisa/repl.vim'                  " repl for langs
Plug 'matze/vim-move'                    " move lines and selections
Plug 'edkolev/promptline.vim'            " promptline
Plug 'tyru/current-func-info.vim'        " get current function name
Plug 'tpope/vim-repeat'                  " vim repeat the last command on
Plug 'thinca/vim-ref'                    " integrated reference viewer
Plug 'jceb/vim-hier'                     " hl quickfix errors
Plug 'mattesgroeger/vim-bookmarks'       " vim bookmarks
Plug 'docunext/closetag.vim'             " close open HTML/XML tags
Plug 'ujihisa/neco-look'                 " look completion for english
Plug 'dkarter/bullets.vim'               " automated bullet list
Plug 'bhurlow/vim-parinfer'              " balance your parenthesis
Plug 'itchyny/vim-highlighturl'          " URL highlight everywhere
Plug 'osyo-manga/vim-precious'           " set buffer ft based on code block
Plug 'kana/vim-textobj-user'             " for text object creation (vim-precious)
Plug 'thinca/vim-quickrun'               " run commands quickly (vim-precious)
Plug 'osyo-manga/vim-hopping'            " incrementall buffer line filtering
Plug 'beloglazov/vim-online-thesaurus', {
            \ 'on': 'OnlineThesaurusCurrentWord' }  " word lookup in online thesaurus (-K)
"Plug 'fmv1992/vim_dictionary'             " dictionary for ViM

" ****     vim-fireplace dependencies     ****
Plug 'tpope/vim-classpath'                         " vim classpath
Plug 'skywind3000/asyncrun.vim'                    " run async commands
"Plug 'jpalardy/vim-slime'                         " slime for vim
"Plug 'editorconfig/editorconfig-vim'              " editorconfg
"Plug 'brookhong/k.vim'                            " run external commands



" ==== Plugins for multiple text selection ====
Plug 'terryma/vim-multiple-cursors'              " vim multiple cursors


" ==== Plugins for text visualization ====
Plug 'osyo-manga/vim-brightest'                          " highlight cursor word
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }  " preview in commandline window
Plug 'osyo-manga/vim-over'                               " :substitute preview
Plug 'valloric/vim-operator-highlight'                   " highlight operator characters
Plug 't9md/vim-quickhl', { 'on': [
            \ 'QuickhlManualEnable', 'QuickhlManualDisable', 'QuickhlManualList',
            \ 'QuickhlManualReset', 'QuickhlManualColors', 'QuickhlManualAdd',
            \ 'QuickhlManualDelete', 'QuickhlManualLock', 'QuickhlManualUnlock',
            \ 'QuickhlManualLockToggle', 'QuickhlManualLockWindow', 'QuickhlManualUnlockWindow',
            \ 'QuickhlManualLockWindowToggle', 'QuickhlCwordEnable', 'QuickhlCwordDisable',
            \ 'QuickhlCwordToggle', 'QuickhlTagEnable', 'QuickhlTagDisable',
            \ 'QuickhlTagToggle',
            \ ] }                                       " highlight selected word



" ==== Plugins for documentation purposes and writing ====
"              for PlantUml diagrams
"              for LaTeX file editing
"              for vim distraction free typing
Plug 'vim-pandoc/vim-pandoc'                       " pandoc integration and utilities
Plug 'vim-pandoc/vim-pandoc-syntax'                " pandoc markdown syntax
Plug 'jceb/vim-orgmode'                            " org mode for vim
Plug 'tpope/vim-speeddating'                       " for handling dates in vim
Plug 'aklt/plantuml-syntax'                        " vim syntax for plantuml
Plug 'scrooloose/vim-slumlord'                     " in-line preview for plantuml diagrams
Plug 'lervag/vimtex', { 'for': 'tex' }             " editing LaTeX files
Plug 'junegunn/goyo.vim'                           " distraction-free writing in Vim
Plug 'junegunn/limelight.vim'                      " light theme for goyo

"Plug 'roxma/vim-syntax-compl-pop'                 " syntax aware completion in md
"Plug 'xolox/vim-notes' | Plug 'xolox/vim-misc'    " easy note taking



" ==== Plugins for python/python3 language auto-completion
"      syntax checking, highlighting and more
Plug 'davidhalter/jedi-vim'              " python jedi auto-completion (the best)
Plug 'vim-scripts/python.vim--Vasiliev'  " enhanced python syntax highlighting
Plug 'Vimjas/vim-python-pep8-indent'     " python indentation style for vim
Plug 'tell-k/vim-autopep8'               " autopep8 plugin for python
Plug 'tweekmonster/impsort.vim'          " sort and highlight py imports
Plug 'plytophogy/vim-virtualenv'         " for working with virtualenvs

"Plug 'ehamberg/vim-cute-python'         " conceal for python
"Plug 'python-rope/ropevim', { 'for': [ 'python' ] }                  " rope python code assist
"Plug 'lambdalisue/vim-pyenv'                                         " python virtual env (if required)
"Plug 'klen/python-mode',
"            \ {
"            \ 'do': function('GitRecurse'),
"            \ 'for': [ 'python' ]
"            \ }                                                      " python-mode,pylint,rope,pydoc



" ==== Plugin for YouCompleteMe ====
"      being used only in gui mode for MacVim
if has('gui_macvim')
    Plug 'valloric/youcompleteme',
                \ {
                \ 'do': function('YCMBuilder'),
                \ 'for': [ 'c', 'cpp', 'go', 'javascript', 'erlang', 'python', 'haskell' ]
                \ }
endif


" ==== Plugin for code completion and commenting framework(s) section ====
"if has('python')
"    " this does not go along well with ycm which is only
"    " in the gui mode, so disabling it in the gui mode
"    " also it's based on python
"    Plug 'maralla/completor.vim'                       " async completion framework
"endif


" ############################### Plugins sections ends ##############################
" vim: tabstop=4 shiftwidth=4 softtabstop=4 expandtab
