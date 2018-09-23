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
set hidden

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

set nocompatible              " be iMproved, required


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
        !cd ./third_party/ycmd/third_party/tern_runtime && npm install
    endif
endfunction

call plug#begin('~/.vim/plugged')
    Plug 'w0rp/ale'
    Plug 'Shougo/neocomplete.vim'
    Plug 'Shougo/neoinclude.vim'
    Plug 'Chiel92/vim-autoformat'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Shougo/vimproc.vim', { 'do': 'make -j4' }
    Plug 'bronson/vim-trailing-whitespace', { 'on': 'FixWhitespace' }
    Plug 'mhinz/vim-startify'
    Plug 'benizi/vim-automkdir'
    Plug 'easymotion/vim-easymotion'
    Plug 'Yggdroot/indentLine'
    Plug 'itchyny/calendar.vim'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-dispatch'
    Plug 'conradirwin/vim-bracketed-paste'
    Plug 'shougo/echodoc', { 'on': ['EchoDocEnable', 'EchoDocDisable'] }
    Plug 'Shougo/context_filetype.vim'
    Plug 'schickling/vim-bufonly', { 'on': ['BufOnly', 'Bonly'] }
    Plug 'rhysd/vim-healthcheck'
    Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
    Plug 'shougo/vimshell.vim'
    Plug 'rbtnn/vimconsole.vim', { 'on': [
                \ 'VimConsoleLog', 'VimConsoleOpen', 'VimConsoleWarn', 'VimConsoleError',
                \ 'VimConsoleError', 'VimConsoleToggle', 'VimConsoleClear', 'VimConsoleRedraw',
                \ ],
                \ }
    Plug 'flazz/vim-colorschemes'
    Plug 'morhetz/gruvbox'
    Plug 'trusktr/seti.vim'
    Plug 'lifepillar/vim-solarized8'
    Plug 'baeuml/summerfruit256.vim'
    Plug 'jacoborus/tender.vim'
    Plug 'kabbamine/yowish.vim'
    Plug 'tyrannicaltoucan/vim-quantum'
    Plug 'lifepillar/vim-wwdc16-theme'
    Plug 'lifepillar/vim-wwdc17-theme'
    Plug 'yuttie/hydrangea-vim'
    Plug 'yuttie/inkstained-vim'
    Plug 'iCyMind/NeoSolarized'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'
    Plug 'shougo/neosnippet-snippets'
    Plug 'shougo/neosnippet.vim'
    Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'Shougo/unite.vim'
    Plug 'Shougo/unite-outline'
    Plug 'ujihisa/unite-colorscheme'
    Plug 'Shougo/neomru.vim'
    Plug 'mattn/unite-vim_advent-calendar'
    Plug 'mattn/webapi-vim'
    Plug 'mattn/wwwrenderer-vim'
    Plug 'thinca/vim-openbuf'
    Plug 'choplin/unite-vim_hacks'
    Plug 'osyo-manga/unite-option'
    Plug 'tsukkee/unite-help'
    Plug 'osyo-manga/unite-quickfix'
    Plug 'zhaocai/unite-scriptnames'
    Plug 'shougo/vimfiler.vim'
    Plug 'xuyuanp/nerdtree-git-plugin'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
    Plug 'scrooloose/nerdtree' , { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    augroup nerd_tree_load
        autocmd!
        autocmd VimEnter * silent! autocmd! FileExplorer
        autocmd BufEnter,BufNew *
            \  if isdirectory(expand('<amatch>'))
            \|   call plug#load('nerdtree')
            \|   execute 'autocmd! nerd_tree_load'
            \| endif
    augroup END
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'mhinz/vim-signify'
    Plug 'ervandew/supertab'
    Plug 'junegunn/vim-easy-align', { 'on':
                \ ['<Plug>(EasyAlign)', 'EasyAlign']  }
    Plug 'godlygeek/tabular'
    Plug 'Shougo/neco-syntax'
    Plug 'ujihisa/neco-look'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'eagletmt/neco-ghc'             ,{ 'for': 'haskell' }
    Plug 'eagletmt/ghcmod-vim'           ,{ 'for': 'haskell' }
    "Plug 'enomsg/vim-haskellConcealPlus' ,{ 'for': 'haskell' }
    "Plug 'travitch/hasksyn'              ,{ 'for': ['haskell', 'cabal'] }
    "Plug 'neovimhaskell/haskell-vim'     ,{ 'for': 'haskell' }
    "Plug 'elliottt/vim-haskell'          ,{ 'for': 'haskell' }
    "Plug 'Twinside/vim-hoogle'           ,{ 'for': 'haskell' }
    "Plug 'osyo-manga/vim-hoogle-web'
    "Plug 'itchyny/vim-haskell-indent'    ,{ 'for': 'haskell' }
    "Plug 'dan-t/vim-hsimport'            ,{ 'for': 'haskell' }
    "Plug 'alx741/vim-hindent'            ,{ 'for': 'haskell' }
    "Plug 'mpickering/hlint-refactor-vim' ,{ 'for': 'haskell' }
    "Plug 'pbrisbin/vim-syntax-shakespeare'
    "Plug 'pbrisbin/html-template-syntax'
    "Plug 'dag/vim2hs',{ 'for': 'haskell' }
    "Plug 'nbouscal/vim-stylish-haskell',{ 'for': 'haskell' }
    "Plug 'alx741/vim-stylishask'
    "Plug 'adinapoli/cumino'  ,{ 'for': 'haskell' }
    "Plug 'bitc/vim-hdevtools',{ 'for': 'haskell' }
    "Plug 'philopon/hassistant.vim'
    Plug 'idris-hackers/idris-vim'
    Plug 'rking/ag.vim'
    Plug 'lambdatoast/elm.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'osyo-manga/unite-airline_themes'
    Plug 'majutsushi/tagbar'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'jaxbot/semantic-highlight.vim', { 'on' : [
                \ 'SemanticHighlight',
                \ 'SemanticHighlightRevert',
                \ 'SemanticHighlightToggle'
                \ ] }
    Plug 'rakr/vim-two-firewatch'
    Plug 'thinca/vim-ft-clojure'     ,{ 'for': 'clojure' }
    Plug 'venantius/vim-eastwood'    ,{ 'for': 'clojure' }
    Plug 'kovisoft/paredit'          ,{ 'for': 'clojure' }
    Plug 'tpope/vim-fireplace'       ,{ 'for': 'clojure' }
    Plug 'guns/vim-clojure-highlight'
    Plug 'guns/vim-clojure-static'
    Plug 'venantius/vim-cljfmt'
    Plug 'ujihisa/neoclojure.vim'    ,{ 'for': 'clojure' }
    Plug 'clojure-vim/async-clj-omni' ,{ 'for': 'clojure' }
    Plug 'tpope/vim-salve'           ,{ 'on': [ 'Console' ] }
    Plug 'artur-shaik/vim-javacomplete2',{ 'for': 'java' }
    Plug 'airblade/vim-rooter'          ,{ 'for': 'java' }
    Plug 'fatih/vim-go'                 ,{ 'for': 'go', 'do': ':GoInstallBinaries', 'tag': '*' }
    Plug 'tweekmonster/hl-goimport.vim' ,{ 'for': 'go' }
    Plug 'nsf/gocode'                   ,{ 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
    Plug 'maksimr/vim-jsbeautify', {
                \ 'do' : function('InstallJsBeautify'),
                \ 'for': ['javascript', 'html'] }
    Plug 'maxmellon/vim-jsx-pretty'     , { 'for':
                \ ['javascript','javascript.jsx'] }
    Plug 'jelera/vim-javascript-syntax' , { 'for': 'javascript' }
    Plug 'othree/yajs.vim'              , { 'for': 'javascript' }
    Plug 'othree/es.next.syntax.vim'    , { 'for': 'javascript' }
    Plug 'othree/jsdoc-syntax.vim'      , { 'for': 'javascript' }
    Plug 'heavenshell/vim-jsdoc'        , { 'for': 'javascript' }
    Plug 'othree/jspc.vim', { 'for':
                \ ['javascript', 'javascript.jsx'] }
    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript',  { 'for':
                \ ['javascript', 'javascript.jsx'] }
    Plug 'neoclide/vim-jsx-improve', { 'for':
                \ ['javascript', 'javascript.jsx'] }
    Plug 'elzr/vim-json'
    Plug 'XadillaX/json-formatter.vim' ,{ 'do': 'npm install jjson -g' }
    Plug 'rhysd/vim-fixjson' ,{ 'do': 'npm install -g fixjson' }
    Plug 'othree/javascript-libraries-syntax.vim', { 'for': [
                \ 'javascript',
                \ 'coffee',
                \ 'ls',
                \ 'typescript']
                \ }
    Plug 'marijnh/tern_for_vim',{
                \ 'do': function('BuildTern'),
                \ 'for': ['javascript', 'javascript.jsx']}
    Plug 'galooshi/vim-import-js',{
                \ 'do': function('GetImport'),
                \ 'on': ['ImportJSWord', 'ImportJSFix',
                \ 'ImportJSGoto']}
    Plug 'shutnik/jshint2.vim',{
                \ 'do': function('InstallJsHint'),
                \ 'for': 'javascript' }
    Plug 'moll/vim-node' ,{ 'for': 'javascript' }
    Plug 'mmalecki/vim-node.js' ,{ 'for': 'javascript' }
    Plug 'myhere/vim-nodejs-complete',{ 'for': 'javascript' }
    Plug 'mattn/jscomplete-vim',{ 'for': 'javascript' }
    Plug 'jbgutierrez/vim-babel'    " wrapper around babel.js
    Plug 'mattn/webapi-vim'         " vim interface to Web API
    Plug '1995eaton/vim-better-javascript-completion', { 'for': 'javascript' }
    Plug 'Quramy/tsuquyomi' , {
                \ 'do': function('InstallTS'),
                \ 'for': 'typescript' }
    Plug 'leafgarland/typescript-vim'   , { 'for': 'typescript' }
    Plug 'Quramy/vim-js-pretty-template', { 'for': 'typescript' }
    Plug 'bigfish/vim-js-context-coloring',{ 'for': 'javascript' }
    Plug 'youthy/vimerl-complete'
    Plug 'vim-erlang/vim-erlang-omnicomplete' ,{ 'for': 'erlang' }
    Plug 'vim-erlang/vim-erlang-runtime'      ,{ 'for': 'erlang' }
    Plug 'vim-erlang/vim-erlang-compiler'     ,{ 'for': 'erlang' }
    Plug 'vim-erlang/vim-erlang-skeletons'    ,{ 'for': 'erlang' }
    Plug 'vim-erlang/erlang-motions.vim'      ,{ 'for': 'erlang' }
    Plug 'vim-erlang/vim-erlang-tags'         ,{ 'for': 'erlang' }
    Plug 'ehamberg/vim-cute-erlang'           ,{ 'for': 'erlang' }
    Plug 'melekes/vim-erlang-spec'            ,{ 'for': 'erlang' }
    Plug 'oscarh/vimerl'                      ,{ 'for': 'erlang' }
    Plug 'ppikula/vim-wrangler'
    Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }
    Plug 'slashmili/alchemist.vim', { 'for': ['elixir', 'eelixir'] }
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'benmills/vimux'
    Plug 'ktonga/vim-follow-my-lead'
    Plug 'hecal3/vim-leader-guide'
    " Plug 'jimmay5469/vim-spacemacs'
    Plug 'derekwyatt/vim-scala', { 'for': 'scala'}
    "Plug 'ensime/ensime-vim'
    "Plug 'megaannum/vimside'
    Plug 'mattn/emmet-vim', { 'for':
                \ ['html', 'xhtml', 'css', 'xml', 'xls', 'markdown'] }
    Plug 'othree/html5.vim', { 'for': ['html', 'xhttml', 'css'] }
    Plug 'othree/xml.vim'
    Plug 'sukima/xmledit'
    Plug 'vim-scripts/xslt'
    Plug 'Valloric/MatchTagAlways'
    Plug 'gko/vim-coloresque'
    if has('python') || has('python3')
        Plug 'Rykka/colorv.vim', {
                    \ 'on': [
                    \ 'ColorV', 'ColorVView', 'ColorVPreview',
                    \ 'ColorVPicker', 'ColorVEdit', 'ColorVEditAll',
                    \ 'ColorVInsert', 'ColorVList', 'ColorVName',
                    \ 'ColorVScheme', 'ColorVSchemeFav',
                    \ 'ColorVSchemeNew', 'ColorVTurn2'
                    \ ]}
    endif
    Plug 'osyo-manga/vim-marching', { 'for': 'cpp' }
    Plug 'rhysd/vim-clang-format',  { 'on': 'ClangFormat' }
    Plug 'osyo-manga/vim-reunions', { 'for': 'cpp' }
    Plug 'vim-jp/vim-cpp',          { 'for': [ 'c', 'cpp'] }
    Plug 'derekwyatt/vim-protodef', { 'for': ['c', 'cpp'] }
    Plug 'derekwyatt/vim-fswitch',  { 'for': ['c', 'cpp'] }
    Plug 'vim-scripts/DoxygenToolkit.vim',   { 'for': 'cpp' }
    Plug 'osyo-manga/vim-cpp-syntax-reserved_identifiers', { 'for': 'cpp' }
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
    " === deprecated plugins
    "Plug 'myint/clang-complete',{ 'for': ['cpp','c']}   " using fork for python3 support
    "Plug 'vim-scripts/c.vim',   { 'for': ['c','cpp'] }  " c/cpp ide
    Plug 'lervag/vimtex', { 'for': 'tex' }
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tacahiroy/ctrlp-funky'
    Plug 'voronkovich/ctrlp-nerdtree.vim', { 'on': 'CtrlPNerdTree' }
    Plug 'sgur/ctrlp-extensions.vim',      { 'on': [
                \ 'CtrlPCmdline',
                \ 'CtrlPMenu',
                \ 'CtrlPYankring']
                \ }
    Plug 'pielgrzym/ctrlp-sessions',    { 'on': ['CtrlPSessions', 'MkS'] }
    Plug 'vim-ctrlspace/vim-ctrlspace'
    Plug 'mattn/ctrlp-launcher',        { 'on': 'CtrlPLauncher' }
    Plug 'h14i/vim-ctrlp-buftab',       { 'on': 'CtrlPBufTab' }
    Plug 'mattn/ctrlp-windowselector',  { 'on': 'CtrlPWindowSelector' }
    Plug 'fisadev/vim-ctrlp-cmdpalette',{ 'on': 'CtrlPCmdPalette' }
    Plug 'elentok/ctrlp-objects.vim',   { 'on': [
            \ 'CtrlPModels',
            \ 'CtrlPViews',
            \ 'CtrlPControllers',
            \ 'CtrlPTemplates',
            \ 'CtrlPPresenters' ]
            \ }
    Plug 'jasoncodes/ctrlp-modified.vim'
    Plug 'nmanandhar/vim-ctrlp-menu'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'jiangmiao/auto-pairs'
    Plug 'gorkunov/smartpairs.vim'
    Plug 'andymass/vim-matchup'
    Plug 'ujihisa/repl.vim'
    Plug 'brookhong/k.vim'
    Plug 'matze/vim-move'
    Plug 'edkolev/promptline.vim'
    Plug 'tyru/current-func-info.vim'
    Plug 'tpope/vim-repeat'
    Plug 'thinca/vim-ref'
    Plug 'jceb/vim-hier'
    Plug 'mattesgroeger/vim-bookmarks'
    Plug 'docunext/closetag.vim'
    Plug 'ujihisa/neco-look'
    Plug 'dkarter/bullets.vim'
    Plug 'bhurlow/vim-parinfer'
    Plug 'itchyny/vim-highlighturl'
    Plug 'osyo-manga/vim-precious'
    Plug 'kana/vim-textobj-user'
    Plug 'thinca/vim-quickrun'
    Plug 'osyo-manga/vim-hopping'
    Plug 'beloglazov/vim-online-thesaurus', {
                \ 'on': 'OnlineThesaurusCurrentWord' }
    Plug 'tpope/vim-classpath'
    Plug 'skywind3000/asyncrun.vim'
    "Plug 'jpalardy/vim-slime'
    "Plug 'editorconfig/editorconfig-vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'osyo-manga/vim-brightest'
    Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
    Plug 'osyo-manga/vim-over'
    Plug 'valloric/vim-operator-highlight'
    Plug 't9md/vim-quickhl', { 'on': [
                \ 'QuickhlManualEnable', 'QuickhlManualDisable', 'QuickhlManualList',
                \ 'QuickhlManualReset', 'QuickhlManualColors', 'QuickhlManualAdd',
                \ 'QuickhlManualDelete', 'QuickhlManualLock', 'QuickhlManualUnlock',
                \ 'QuickhlManualLockToggle', 'QuickhlManualLockWindow', 'QuickhlManualUnlockWindow',
                \ 'QuickhlManualLockWindowToggle', 'QuickhlCwordEnable', 'QuickhlCwordDisable',
                \ 'QuickhlCwordToggle', 'QuickhlTagEnable', 'QuickhlTagDisable',
                \ 'QuickhlTagToggle',
                \ ] }
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'jceb/vim-orgmode'
    Plug 'tpope/vim-speeddating'
    Plug 'roxma/vim-syntax-compl-pop'
    "Plug 'xolox/vim-notes' | Plug 'xolox/vim-misc'
    Plug 'davidhalter/jedi-vim', { 'for': [ 'python' ] }
    Plug 'vim-scripts/python.vim--Vasiliev', { 'for': [ 'python' ] }
    Plug 'Vimjas/vim-python-pep8-indent', { 'for': [ 'python' ] }
    Plug 'tell-k/vim-autopep8', { 'for': [ 'python' ] }
    Plug 'ehamberg/vim-cute-python', { 'for': [ 'python' ] }
    Plug 'tweekmonster/impsort.vim', { 'for': [ 'python' ] }
    Plug 'plytophogy/vim-virtualenv', { 'for': [ 'python' ] }
    Plug 'python-rope/ropevim', { 'for': [ 'python' ] }
    Plug 'lambdalisue/vim-pyenv'
    Plug 'klen/python-mode',
                \ {
                \ 'do': function('GitRecurse'),
                \ 'for': [ 'python' ]
                \ }
    Plug 'aklt/plantuml-syntax'
    Plug 'scrooloose/vim-slumlord'
    if has('gui_macvim')
        Plug 'valloric/youcompleteme',
                    \ {
                    \ 'do': function('YCMBuilder'),
                    \ 'for': [ 'c', 'cpp', 'go', 'javascript', 'erlang', 'python', 'haskell' ]
                    \ }
    endif
call plug#end()

" ############################### Plugins sections ends ##############################
" vim: tabstop=4 shiftwidth=4 softtabstop=4 expandtab
