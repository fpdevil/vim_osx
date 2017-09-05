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
" Last Updated Date: 27 August 2017
"
" Plugin Manager: Minimalist Vim Plugin Manager
"                 By Junegunn (Thanks)
"
" Customized .vimrc configuration file
" supports for some of the major languages...
"
" Haskell
" Erlang
" JavaScript ... flavors
" Python 3 (via jedi) and YouCompleteMe in gui mode
" C/C++  clang based autocompletion (via ycmd for MacVim)
" Scala
" Clojure
" GO

" ============================= VERY IMPORTANT ============================
" ====        To install plugin the first time:                        ====
" ====        > vim +BundleInstall +qall                               ====
" ====        cd ~/.vim/bundle/vimproc.vim && make                     ====
" =========================================================================

"{{{ Installing the vim-plug directly for the first time
"    define local script variables
let s:is_vim_plug_already_installed = 0
let s:vim_plug_manager = expand('~/.vim/autoload/plug.vim')
let s:vim_plug_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if empty(glob(s:vim_plug_manager))
    echo "> Installing the vim-plug for first use..."
    echo ">"
    silent !mkdir -p ~/.vim/autoload
    silent exec '!/usr/bin/curl -fLo' . s:vim_plug_manager . ' --create-dirs ' . s:vim_plug_url
    let s:is_vim_plug_already_installed = 1
    augroup vimplug
        autocmd!
        autocmd VimEnter * PlugInstall
    augroup END
endif

" load the vim-plug for the first time manually
if s:is_vim_plug_already_installed
    :execute 'source '.fnameescape(s:vim_plug_manager)
endif
"}}}

"{{{ custom vim configuration loading section
"    define local variables for config
let s:vim_custom_config = "~/.vim/config/"
let s:bundled_plugins = 'bundled_plugins.vim'
let s:bundled_plugins_path = s:vim_custom_config . 'plugins' . '/' . s:bundled_plugins

function! s:LoadVimConfigs(base, cfg)
    let l:vpath = s:vim_custom_config
    exec "source " . l:vpath . a:base . '/' . a:cfg
endfunction
"}}}

" ########################################################################
" ########################    Plugin conf start   ########################
" ########################################################################

let g:plug_dir = expand('~/.vim/plugged')
call plug#begin(g:plug_dir)
if filereadable(expand(s:bundled_plugins_path))
    "source ~/.vim/bundled_plugins.vim
    call s:LoadVimConfigs("plugins", s:bundled_plugins)
endif
call plug#end()

" ########################################################################
" ########################     Plugin conf end    ########################
" ########################################################################

"{{{ install the listed plugins for the first time
if s:is_vim_plug_already_installed
    echo "> Installing bundled plugins... ignore errors for key map..."
    :PlugInstall
endif
"}}}

" =========================================================================
" #  define a global variable for holding the vim plugin configuration    #
" #  settings location and load the plugin settings, vim core editor      #
" #  settings and custom functions                                        #
" =========================================================================
let g:plugins_config = "~/.vim/config/layers/"

call s:LoadVimConfigs("core", "core_settings.vim")
call s:LoadVimConfigs("plugins", "plugin_settings.vim")
call s:LoadVimConfigs("core", "custom_functions.vim")
call s:LoadVimConfigs("core", "insert_templates.vim")
call s:LoadVimConfigs("core", "custom_settings.vim")


" ========================================================================
" ============      End of the main .vimrc configuration     =============
" ========================================================================
