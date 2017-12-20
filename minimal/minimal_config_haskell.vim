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
    Plug 'Shougo/vimproc.vim', { 'do': 'make' }                                     " vimproc asynchronous

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
call plug#end()

