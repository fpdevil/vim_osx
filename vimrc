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
" Last Updated Date: 16 Dec 2016
"
" Customized .vimrc configuration file
" It supports some of the major languages which I use
" Haskell
" Erlang
" JavaScript ... flavors
" Python 3 (via jedi)
" C/C++ (via ycmd)
" Scala
" Clojure (I don't use, but started learning)
"
" Original configuration template used from Yann Esposito
" http://yannesposito.com
" Thanks to @yogsototh
" also a great site for vimrc generation at http://5.vim-bootstrap.appspot.com/
"
" ============================= VERY IMPORTANT ============================
" ====        To install plugin the first time:                        ====
" ====        > vim +BundleInstall +qall                               ====
" ====        cd ~/.vim/bundle/vimproc.vim && make                     ====
" ====        cabal install ghc-mod                                    ====
" =========================================================================
"
" ########################################################################
" ########################    Plugin conf start   ########################
" ########################################################################

call plug#begin('~/.vim/plugged')
if filereadable(expand("~/.vim/bundled_plugins.vim"))
    source ~/.vim/bundled_plugins.vim
endif
call plug#end()

" ########################################################################
" ########################     Plugin conf end    ########################
" ########################################################################

" ------------------------------------------------------------------------
" load the plugin settings, vim core editor settings and custom functions
" ------------------------------------------------------------------------
source ~/.vim/core_settings.vim
source ~/.vim/plugin_settings.vim
source ~/.vim/custom_functions.vim


" End of the main .vimrc configuration
" ========================================================================
