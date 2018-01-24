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

    Plug 'Shougo/neocomplete.vim'

    Plug 'vim-airline/vim-airline'                                                  " Airline statusbar
    Plug 'vim-airline/vim-airline-themes'                                           " Airline themes
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }                         " js for vim
    Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }                          " beautify js
    "Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }                    " enhanced js syntax
    "Plug 'othree/yajs.vim', { 'for': 'javascript' }                                 " yet another js
    "Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }                       " syntax for ECMA
    "Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }             " js param complete
    "Plug 'einars/js-beautify', { 'do': 'git submodule update --init --recursive', 'for': 'javascript' }
    "Plug 'mxw/vim-jsx'                                                              " json/js support
    "Plug 'othree/javascript-libraries-syntax.vim', { 'for': [
    "            \ 'javascript',
    "            \ 'coffee',
    "            \ 'ls',
    "            \ 'typescript']
    "            \ }                                                                 " js syntax check and library support
    "Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }                    " tern plugin for vim js
    "Plug 'shutnik/jshint2.vim', { 'for': 'javascript' }                             " JSHint integration
    "Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }                           " Generate JSDoc to your JavaScript code
    "Plug 'moll/vim-node', { 'for': 'javascript' }                                   " Tools & Env for node.js
    "Plug 'myhere/vim-nodejs-complete', { 'for': 'javascript' }                      " nodejs omnifunc
    "Plug 'mattn/jscomplete-vim', { 'for': 'javascript' }                            " vim omnifunc for JavaScript
    "Plug 'jbgutierrez/vim-babel'                                                    " wrapper around babel.js
    "Plug 'mattn/webapi-vim'                                                         " vim interface to Web API
call plug#end()

