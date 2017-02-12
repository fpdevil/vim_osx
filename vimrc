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
"
" Haskell
" Erlang
" JavaScript ... flavors
" Python 3 (via jedi) and YouCompleteMe in gui mode
" C/C++ (via ycmd)
" Scala
" Clojure (I don't use, but started learning)
" GO (learning...)

" Original configuration template used from Yann Esposito
" http://yannesposito.com
" Thanks to @yogsototh
" also a great site for vimrc generation at http://5.vim-bootstrap.appspot.com/

" ============================= VERY IMPORTANT ============================
" ====        To install plugin the first time:                        ====
" ====        > vim +BundleInstall +qall                               ====
" ====        cd ~/.vim/bundle/vimproc.vim && make                     ====
" =========================================================================
" Installing the vim-plug directly without the above {{{
let is_vim_plug_already_installed = 0
let vim_plug_location = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_location)
    echo "> Installing the vim-plug..."
    echo ">"
    silent !mkdir -p ~/.vim/autoload
    silent !/usr/bin/curl -fLo ~/.vim/autoload/plug.vim \
                            --create-dirs \
                            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let is_vim_plug_already_installed = 1
endif
" load the vim-plug for first time manually
if is_vim_plug_already_installed
    :execute 'source '.fnameescape(vim_plug_location)
endif
" }}}

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

" install the plugins for the first time {{{
if is_vim_plug_already_installed
    echo "> Installing bundled plugins... ignore errors for keymap..."
    :PlugInstall
endif
" }}}

" ------------------------------------------------------------------------
" load the plugin settings, vim core editor settings and custom functions
" ------------------------------------------------------------------------
" {{{
source ~/.vim/core_settings.vim
source ~/.vim/plugin_settings.vim
source ~/.vim/custom_functions.vim
" }}}

" End of the main .vimrc configuration
" ========================================================================
