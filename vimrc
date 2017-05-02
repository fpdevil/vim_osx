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
let s:is_vim_plug_already_installed = 0
let s:vim_plug_manager = expand('~/.vim/autoload/plug.vim')
let s:vim_plug_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if empty(glob(s:vim_plug_manager))
    echo "> Installing the vim-plug..."
    echo ">"
    silent exec '!/usr/bin/curl -fLo' . s:vim_plug_manager . ' --create-dirs ' . s:vim_plug_url
    let s:is_vim_plug_already_installed = 1
    augroup vimplug
        autocmd!
        autocmd VimEnter * PlugInstall
    augroup END
endif
" load the vim-plug for first time manually
if s:is_vim_plug_already_installed
    :execute 'source ' . fnameescape(s:vim_plug_location)
endif
" }}}

" ########################################################################
" ########################    Plugin conf start   ########################
" ########################################################################

let g:plug_dir = expand('~/.vim/plugged')
call plug#begin(g:plug_dir)
if filereadable(expand("~/.vim/bundled_plugins.vim"))
    source ~/.vim/bundled_plugins.vim
endif
call plug#end()

" ########################################################################
" ########################     Plugin conf end    ########################
" ########################################################################

" install the plugins for the first time {{{
if s:is_vim_plug_already_installed
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
