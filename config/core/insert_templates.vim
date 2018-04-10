" #############################################################################
" ############### Template document declaration for file types ################
" #############################################################################
" vim:set et sw=4
" scriptencoding utf-8


"{{{ get the username in the form of space delimited first name and last name
if has('mac')
    let s:usrname = split(system("finger `whoami`|awk -F: '{print $3}'|head -n1|sed 's/^ //'"), '\n')[0]
elseif has('unix')
    let s:usrname = split(system('whoami | head -n1'), '\n')[0]
endif
"}}}

"{{{ define some local variables for insertingi
"    the line width as under 80
let s:width = 77
"    the email
let s:email = "Singamsetty.Sampath@gmail.com"
"}}}

"# define function for inserting header information in erlang code file {{{

function! s:ErlHeader()
    let s:comment = "%%%"
    let s:line = "%%%" . repeat('-', s:width)
    let s:filename = bufname("%")
    let s:todo = "TODO <explanation>"
    if s:usrname != ''
        let s:author = s:comment . " @author " . s:usrname . " <" . s:email . ">"
        let s:cpr = s:comment . " @copyright (C) " . strftime('%Y') . ", " . s:usrname
        let s:doc = s:comment . " @doc"
        let s:end = s:comment . " @end"
        let s:created = s:comment . " Created : " . strftime('%d %b %Y') . " by " . s:usrname . " <>"
        call append(0, s:line)
        call append(1, s:author)
        call append(2, s:cpr)
        call append(3, s:doc)
        call append(4, s:comment)
        call append(5, s:end)
        call append(6, s:created)
        call append(7, s:line)
    endif
    unlet s:comment
    unlet s:line
    unlet s:filename
    unlet s:todo
    unlet s:author
    unlet s:cpr
    unlet s:doc
    unlet s:end
    unlet s:created
endfunction

augroup ErlHeader
    autocmd!
    autocmd BufNewFile *.erl call s:ErlHeader()
augroup END
"}}}

"{{{ define a function for inserting header declaration in Haskell code file

function! MkModuleHeader()
  let name=ModuleName()
  if !empty(name)
    let a:str = "module " . name . " ( " . " ) where"
    return a:str
  else
    return ''
  endif
endfunction

function! s:HsHeader()
    let s:comment = "--"
    let s:lcomment = "-- |"
    let s:modname = ModuleName()
    let s:line = repeat('-', s:width)
    let s:filename = bufname("%")
    let s:todo = "TODO <explanation>"
    let s:stmt = MkModuleHeader()
    if s:usrname != ''
        let s:module = s:comment     . " Module         : " . s:modname
        let s:copyright = s:comment  . " Copyright      :  (c) Some description... " . strftime('%Y')
        let s:license = s:comment    . " License        : MIT (change this as needed)"
        let s:author = s:comment     . " Author         : " . s:usrname
        let s:maintainer = s:comment . " Maintainer     : " . s:email
        let s:doc = s:comment        . " Description    : "
        call append(0, s:line)
        call append(1, s:lcomment)
        call append(2, s:module)
        call append(3, s:copyright)
        call append(4, s:comment)
        call append(5, s:license)
        call append(6, s:author)
        call append(7, s:maintainer)
        call append(8, s:doc)
        call append(9, s:comment)
        call append(10, s:line)
        call append(11, s:stmt)
    endif
    unlet s:comment
    unlet s:lcomment
    unlet s:line
    unlet s:modname
    unlet s:filename
    unlet s:todo
    unlet s:author
    unlet s:copyright
    unlet s:maintainer
    unlet s:doc
    unlet s:license
    unlet s:stmt
endfunction

augroup HsHeader
    autocmd!
    autocmd BufNewFile *.hs call s:HsHeader()
augroup END
"}}}

"{{{ template declarations for other languages
"    currently the template header for c/c++ are being set by c-support vim
"    plug and so we can exclude the support for *.cpp here. Instead of making
"    change here in the filetype, a condition to check if c-support plugin is
"    available or not is kept and if that plugin is available the template is
"    inserted by plugin

augroup InsertHdr
    autocmd!
    "autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.tex,*.py,*.html exec ":call SetTitle()"
    autocmd BufNewFile *.[ch],*.sh,*.java,*.tex,*.py,*.html exec ":call SetTitle()"
  augroup END

func SetTitle()
    if &filetype == 'sh'
      " for shell script file type
      call setline(1, "\#!/usr/bin/env bash")
      call setline(2, "")
      call setline(3, "#" . repeat('=', 78))
      call setline(4, "\# File Name    : ". expand("%"))
      call setline(5, "\# Author       : ". s:usrname)
      call setline(6, "\# mail         : ". s:email)
      call setline(7, "\# Created Time : ". strftime("%c"))
      call setline(8, "\# Copyright (C) ". strftime("%Y") . " " . s:usrname)
      call setline(9, "#" . repeat('=', 78))
      call setline(10, "")
    endif
    if &filetype == 'cpp'
      if !has_key(g:plugs,'c-support')
        " for cpp file type
        call setline(1, "/*************************************************************************")
        call append(line("."),   "    > File Name    : ". expand("%"))
        call append(line(".")+1, "    > Author       : ". s:usrname)
        call append(line(".")+2, "    > Mail         : ". s:email)
        call append(line(".")+3, "    > Created Time : ". strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "")
        call append(line(".")+8, "using namespace std;")
        call append(line(".")+9, "")
      endif
    endif
    if &filetype == 'c'
      if !has_key(g:plugs,'c-support')
        " for c file type
        call setline(1, "/*************************************************************************")
        call append(line("."),   "    > File Name   : ".expand("%"))
        call append(line(".")+1, "    > Author      : ". s:usrname)
        call append(line(".")+2, "    > Mail        : ". s:email)
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "#include <stdio.h>")
        call append(line(".")+6, "")
      endif
    endif
    if expand("%:e") == 'h'
        " for c headers
        call append(line(".")+5, "")
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
        call append(line(".")+9, "")
    endif
    if expand("%:e") == 'hpp'
        " for cpp headers
        call append(line(".")+5, "")
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_HPP")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_HPP")
        call append(line(".")+8, "#endif")
        call append(line(".")+9, "")
    endif
    if &filetype == 'java'
        " for java files
        call setline(1, "//coding=utf8")
        call setline(2, "/**")
        call setline(3, "\ * @Author       : ". s:usrname)
        call setline(4, "\ * @Created Time : ".strftime("%c"))
        call setline(5, "")
        call setline(6, "\ * @File Name    : ".expand("%"))
        call setline(7, "\ * @Description  :")
        call setline(8, "")
        call setline(9, " */")
        call setline(10,"")
    endif
    if &filetype == 'python'
        " for python files
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# -*- coding:utf-8 -*-")
        call setline(3, "\# Copyright (C) ".strftime("%Y"))
        call setline(4, "")
        call setline(5, "\# @Author       : ". s:usrname)
        call setline(6, "\# @Created Time : ".strftime("%c"))
        call setline(7, "\# @File Name    : ".expand("%"))
        call setline(8, "\# @Description  : ")
        call setline(9, "\########################################################################")
        call setline(10, "")
    endif
    if &filetype == 'html'
        " for html files
        call setline(1, '<!DOCTYPE html>')
        call setline(2, '<html lang="en">')
        call setline(3, '    <head>')
        call setline(4, '        <meta charset="utf-8">')
        call setline(5, '        <title></title>')
        call setline(6, '')
        call setline(7, '        <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.6.1/lodash.min.js"></script>')
        call setline(8, '        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-2.2.1.min.js"></script>')
        call setline(9, '    </head>')
        call setline(10, '   <body>')
        call setline(11, '       <div class="container">')
        call setline(12, '')
        call setline(13, '       </div>')
        call setline(14, '   </body>')
        call setline(15, '</html>')
    endif
endfunc
"}}}

" #############################################################################
" ######################  end of template insert section ######################
" #############################################################################
