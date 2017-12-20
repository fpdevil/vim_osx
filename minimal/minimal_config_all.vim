" Vim Config - optimized for minimal loading
" load with vim -u minimal_config.vim

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

set nocompatible              " be iMproved, required
set hidden

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

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'

    Plug 'scrooloose/syntastic', { 'do': function('InstallJsHint') }
    Plug 'Chiel92/vim-autoformat'
    Plug 'Shougo/neocomplete.vim'
    Plug 'Shougo/neoinclude.vim'
    Plug 'Shougo/vimproc.vim', { 'do': 'make' }                                     " vimproc asynchronous
    Plug 'shougo/vimshell.vim'                                                      " shell in vim
    Plug 'mattn/vim-terminal'                                                       " terminal for vim
    Plug 'benizi/vim-automkdir'                                                     " create dir as required
    Plug 'bronson/vim-trailing-whitespace'                                          " remove trailing white spaces
    Plug 'mhinz/vim-startify'                                                       " fancy start screen for vim
    Plug 'easymotion/vim-easymotion'                                                " vim motions on speed
    Plug 'Yggdroot/indentLine'                                                      " display the indention levels
    Plug 'itchyny/calendar.vim'                                                     " calendar application
    Plug 'flazz/vim-colorschemes'                                                   " Color Schemes
    Plug 'morhetz/gruvbox'                                                          " Retro groove color scheme
    Plug 'trusktr/seti.vim'                                                         " seti colorscheme
    Plug 'altercation/vim-colors-solarized'                                         " solarized color schemes
    Plug 'baeuml/summerfruit256.vim'                                                " 256 color scheme
    Plug 'jacoborus/tender.vim'                                                     " 24bit colorscheme for Vim, Airline
    Plug 'kabbamine/yowish.vim'                                                     " A dark & yellowish vim colorscheme
    Plug 'xolox/vim-colorscheme-switcher'
    Plug 'junegunn/goyo.vim'                                                        " distraction-free writing in Vim
    Plug 'junegunn/limelight.vim'                                                   " light theme for goyo
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
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdcommenter'                                                 " intensely orgasmic commenting
    Plug 'shougo/vimfiler.vim'                                                      " file explorer
    Plug 'scrooloose/nerdtree' , { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }       " NERDTree file browser, Undo list
    Plug 'jistr/vim-nerdtree-tabs'                                                  " NERDTree and tabs together
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }                              " undo history visualizer
    Plug 'tpope/vim-fugitive'                                                       " git integration
    Plug 'airblade/vim-gitgutter'                                                   " show which line changed using git
    Plug 'mhinz/vim-signify'                                                        " show diff via vim sign column
    Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign']  }   " text and code alignment
    Plug 'godlygeek/tabular'                                                        " text filtering and alignment
    Plug 'nathanaelkane/vim-indent-guides'                                          " vim indentation display
    Plug 'ervandew/supertab'                                                        " use TAB for all insertions
    Plug 'Shougo/neco-syntax'                                                       " syntax source for source for neocomplete
    Plug 'tenfyzhong/CompleteParameter.vim'                                         " complete parameter after select completion
    Plug 'Shougo/neco-vim', { 'for': 'vim' }
    Plug 'mhinz/vim-lookup', { 'for': 'vim' }                                       " jump to vim code definitions
    Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }                          " syntax indentation / highlight
    Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }                      " unicode for concealing haskell operators
    Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }                                " ghcmod for haskell in vim
    Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }                                  " ghc haskell
    Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }                                " Hoogle haskell search
    Plug 'pbrisbin/html-template-syntax', { 'for': 'haskell' }                      " Yesod templates
    Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }                                 " HDevTools for Haskell
    Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }                       " Stylish Haskell
    Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }                      " Hlint refactor
    Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell'}                          " haskell indent plugin
    Plug 'dan-t/vim-hsimport', {'for': 'haskell'}                                   " plugin for hsimport
    Plug 'idris-hackers/idris-vim'                                                  " idris language support
    Plug 'rking/ag.vim'                                                             " AGDA language
    Plug 'lambdatoast/elm.vim'                                                      " elm scripting language
    Plug 'vim-airline/vim-airline'                                                  " Airline statusbar
    Plug 'vim-airline/vim-airline-themes'                                           " Airline themes
    Plug 'osyo-manga/unite-airline_themes'                                          " preview airline themes
    Plug 'majutsushi/tagbar'                                                        " tagbar support
    Plug 'kien/rainbow_parentheses.vim'                                             " rainbow parenthesis color brackets
    Plug 'jaxbot/semantic-highlight.vim'                                            " semantic highlighting
    Plug 'guns/vim-clojure-static', { 'for': 'clojure' }                            " clojure support
    Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }                               " clojure formatting tool
    Plug 'venantius/vim-eastwood', { 'for': 'clojure'}                              " clojure lint tool
    Plug 'tpope/vim-fireplace', { 'for': 'clojure' }                                " clojure support
    Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }                       " clojure and scheme support
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
    Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }                          " beautify js
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }                         " js for vim
    Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }                    " enhanced js syntax
    Plug 'othree/yajs.vim', { 'for': 'javascript' }                                 " yet another js
    Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }                       " syntax for ECMA
    Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }             " js param complete
    Plug 'einars/js-beautify', { 'do': 'git submodule update --init --recursive', 'for': 'javascript' }
    Plug 'mxw/vim-jsx'                                                              " json/js support
    Plug 'elzr/vim-json'                                                            " json highlighting
    Plug 'othree/javascript-libraries-syntax.vim', { 'for': [
                \ 'javascript',
                \ 'coffee',
                \ 'ls',
                \ 'typescript']
                \ }                                                                 " js syntax check and library support
    Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }                    " tern plugin for vim js
    Plug 'shutnik/jshint2.vim', { 'for': 'javascript' }                             " JSHint integration
    Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }                           " Generate JSDoc to your JavaScript code
    Plug 'moll/vim-node', { 'for': 'javascript' }                                   " Tools & Env for node.js
    Plug 'ahayman/vim-nodejs-complete', { 'for': 'javascript' }                     " nodejs omnifunc
    Plug 'mattn/jscomplete-vim', { 'for': 'javascript' }                            " vim omnifunc for JavaScript
    Plug 'jbgutierrez/vim-babel'                                                    " wrapper around babel.js
    Plug 'mattn/webapi-vim'                                                         " vim interface to Web API
    Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }                       " erlang indentation, syntax
    Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }                  " erlang code auto completion
    Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }                      " erlang syntax checker, compiler
    Plug 'youthy/vimerl-complete', { 'for': 'erlang' }                              " erlang auto complete
    Plug 'vim-erlang/vim-erlang-skeletons', { 'for': 'erlang' }                     " erlang templates
    Plug 'akalyaev/vim-erlang-spec', { 'for': 'erlang' }                            " erlang generate specifications
    Plug 'vim-erlang/vim-erlang-tags'                                               " erlang tag generate for vim
    Plug 'vim-erlang/erlang-motions.vim', { 'for': 'erlang' }                       " erlang motions and text objects
    Plug 'christoomey/vim-tmux-navigator'                                           " terminal multiplex
    Plug 'ktonga/vim-follow-my-lead'
    Plug 'hecal3/vim-leader-guide'                                                  " vim keymap-display
    Plug 'jimmay5469/vim-spacemacs'                                                 " spacemacs key bindings
    Plug 'derekwyatt/vim-scala', { 'for': 'scala'}                                  " scala support
    Plug 'mattn/emmet-vim'                                                          " emmet for vim
    Plug 'othree/html5.vim'                                                         " html5 support
    Plug 'othree/xml.vim', { 'for': 'xml' }                                         " xml support
    Plug 'sukima/xmledit'                                                           " xml editor
    Plug 'vim-scripts/xslt'                                                         " xslt ftplugin
    Plug 'Valloric/MatchTagAlways'                                                  " highlight matching tags on markup languages
    Plug 'justmao945/vim-clang', { 'for': ['cpp','c'] }                             " clang completion plugin for vim
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }                       " additional vim syntax highlighting
    Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': 'cpp' }                         " doxygen documentation
    Plug 'myint/clang-complete', { 'for': ['cpp','c']}                              " using fork for python3 support
    Plug 'osyo-manga/vim-marching'                                                  " async clang code completion
    Plug 'rhysd/vim-clang-format', { 'on': 'ClangFormat' }                          " a formatter for C, C++, Obj-C, Java, JS and TypeScript
    Plug 'derekwyatt/vim-protodef', { 'for': 'cpp' }                                " pull c++ function prototypes
    Plug 'vim-jp/vim-cpp', { 'for': [ 'c', 'cpp' ] }                                " c/c++ syntax files
    Plug 'wolfgangmehner/c-support', { 'for': [ 'c','cpp' ] }                       " same as above but updated
    Plug 'lervag/vimtex'                                                            " editing LaTeX files
    Plug 'kien/ctrlp.vim'                                                           " fuzzy file, buffer, mru, tag etc
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
    Plug 'h14i/vim-ctrlp-buftab', { 'on': 'CtrlPBufTab' }                           "
    Plug 'brookhong/k.vim'                                                          " run external commands
    Plug 'matze/vim-move'                                                           " move lines and selections
    Plug 'edkolev/promptline.vim'                                                   " promptline
    Plug 'tyru/current-func-info.vim'                                               " get current function name
    Plug 'jiangmiao/auto-pairs'                                                     " parenthesis auto parentheses pairing
    Plug 'Raimondi/delimitMate'                                                     " auto quotes, parens, brackets, etc
    Plug 'editorconfig/editorconfig-vim'                                            " editorconfg
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
    Plug 'tomtom/tlib_vim'                                                          " for snippets
    Plug 'SirVer/ultisnips'                                                         " for snippets
    Plug 'honza/vim-snippets'                                                       " vim-snippets depends on ultisnippets
    Plug 'MarcWeber/vim-addon-mw-utils'                                             " for snippets
    Plug 'garbas/vim-snipmate'                                                      " for snippets
    Plug 'terryma/vim-multiple-cursors'                                             " vim multiple cursors
    Plug 'osyo-manga/vim-brightest'                                                 " highlight cursor word
    Plug 't9md/vim-quickhl'                                                         " highlight selected word
    Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }                 " vim for elixir
    Plug 'slashmili/alchemist.vim', { 'for': ['elixir', 'eelixir'] }                " elixir integration for vim
    Plug 'vim-pandoc/vim-pandoc'                                                    " pandoc integration and utilities
    Plug 'vim-pandoc/vim-pandoc-syntax'                                             " pandoc markdown syntax
    Plug 'xolox/vim-misc' 
    "Plug 'xolox/vim-notes'                                                         " easy note taking
    Plug 'vim-scripts/python.vim--Vasiliev'                                         " enhanced python syntax highlighting
    Plug 'davidhalter/jedi-vim'                                                     " python jedi auto-completion (the best)
    "Plug 'lambdalisue/vim-pyenv'                                                   " python virtual env (if required)
    Plug 'Vimjas/vim-python-pep8-indent', { 'for':'python' }                        " python indentation style for vim
    Plug 'tell-k/vim-autopep8'                                                      " autopep8 plugin for python
    Plug 'python-rope/ropevim'                                                      " rope for python code assist
call plug#end()

