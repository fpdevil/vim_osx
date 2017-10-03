" #############################################################################
" # This file contains any custom settings or key mappings for vim
" #############################################################################

" # mappings for moving lines and words {{{
"   push line UP and DOWN
"nnoremap <leader><Down> ddp
"nnoremap <leader><Up> ddkP

"   push word under cursor to left and right
nnoremap <leader><Left> "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o><C-l>
nnoremap <leader><Right> "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>/\w\+\_W\+<CR><C-l>
" }}}

" vim-plug specific
" alias to upgrade the vim-plug after doing a plugins update
command! PU PlugUpdate | PlugUpgrade

" handling the cursor shapes (make a straight line in INSERT mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" define settings for the cache
let s:cache_dir = '~/.vim/.cache'

function! g:GetCacheDir(suffix)
  return resolve(expand(s:cache_dir . '/' . a:suffix))
endfunction

" -------------------------------------------------------------------------------------
"  function for handling indent line plugin
" -------------------------------------------------------------------------------------
function! s:ShowIndentLine()
    if !exists('s:available')
        if exists(':IndentLinesToggle') == 2
            IndentLinesToggle
            IndentLinesToggle
        else
            echohl [WARNING]
            echom 'indentLines plugin is not installed, use plug install...'
            echohl None
        endif
        let s:available = 1
    endif
endfunction

autocmd InsertEnter * call s:ShowIndentLine()


" *************************************************************************************
" **********  ctags generated using exuverant ctags at /usr/local/bin/ctags  **********
" **** /usr/local/bin/ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q  ****
" **** --language-force=c++ -f opencv                                              ****
" ****  /usr/local/Cellar/opencv3/HEAD-6328076_4/include/                          ****
" **** system tags generated using the below command and added                     ****
" **** ctags -R -f ~/.vim/tags/systags /usr/include /usr/local/include             ****
" **** set erlang tags generated using the vim-erlang-tags plugin                  ****
" **** cd /usr/local/lib/erlang/lib                                                ****
" **** ~/.vim/plugged/vim-erlang-tags/bin/vim-erlang-tags.erl                      ****
" *************************************************************************************
"set tags+=~/.vim/tags/opencv
set tags+=~/.vim/tags/systags

set tags+=/usr/local/lib/erlang/lib/tags

" -------------------------------------------------------------------------------------
" set cpp includes in the path
" -------------------------------------------------------------------------------------
set path=.,/usr/include,/usr/local/include

" -------------------------------------------------------------------------------------
" additional path settings to include opencv
" -------------------------------------------------------------------------------------
set path+=/usr/local/opt/opencv3/include
set path+=/usr/local/opt/opencv3/include/opencv
set path+=/usr/local/opt/opencv3/include/opencv2

" -------------------------------------------------------------------------------------
" path for erlang
" -------------------------------------------------------------------------------------
set path+=/usr/local/opt/erlang/bin

" -------------------------------------------------------------------------------------
" http://vim.wikia.com/wiki/VimTip1546: Automatically add Python paths to Vim path
" -------------------------------------------------------------------------------------
if has('python3')
python3 << EOF
import os
import sys
import vim
for p in sys.path:
    # Add each directory in sys.path, if it exists.
    if os.path.isdir(p):
        # Command 'set' needs backslash before each space.
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
endif"has('python3')

" -------------------------------------------------------------------------------------
" for external path setup in macvim
" -------------------------------------------------------------------------------------
if has('gui_running')
    set path+=/usr/local/lib/python3.6/site-packages
    let $PYTHONPATH = "/usr/local/lib/python3.6/site-packages"
    let $PYTHON3_INCLUDE_DIR = "/usr/local/opt/python3/Frameworks/Python.framework/Versions/3.6/include/python3.6m"
    let $PYTHON3_LIBRARY = "/usr/local/opt/python3/Frameworks/Python.framework/Versions/3.6/lib/python3.6/config-3.6m-darwin"
    let $GOPATH = $HOME . "/sw/programming/gocode/go"
    let $PATH = $HOME . "/usr/local/opt/go/libexec/bin:" . $PATH
endif
