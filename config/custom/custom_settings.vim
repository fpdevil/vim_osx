" #############################################################################
" #  This file contains any custom settings or key mappings for vim           #
" #############################################################################

" buffer modifiability allow
set ma

" vim-plug specific
" alias to upgrade the vim-plug after doing a plugins update
command! PU PlugUpdate | PlugUpgrade

" open .vimrc with a shortcut
nnoremap <leader>vim :tabnew ~/.vim/vimrc<cr>

" to provide a menu interface for the unite
let g:unite_source_menu_menus = {}

" menu prefix key (for all Unite menus)
nnoremap [menu] <Nop>
nmap <LocalLeader> [menu]
" menus menu
nnoremap <silent>[menu]u :Unite -silent -winheight=20 menu<CR>

" ------------------------------------------------------------------------------------
" ***           custom color highlighting and alerts in common editing             ***
" ------------------------------------------------------------------------------------
highlight Cursor guibg=black guifg=pink             " gui cursor color
highlight Search guibg=peru guifg=wheat             " gui search highlight

highlight CommaAndNonSpace      ctermbg=brown guifg=white guibg=brown
highlight EOLSpace              ctermbg=brown guifg=white guibg=brown
highlight HashRocketAndNonSpace ctermbg=brown guifg=white guibg=brown
highlight NonSpaceAndHashRocket ctermbg=brown guifg=white guibg=brown
highlight SpaceAndComma         ctermbg=brown guifg=white guibg=brown
highlight Tab                   ctermbg=brown guifg=white guibg=brown
highlight WideEisuu             ctermbg=brown guifg=white guibg=brown
highlight WideSpace             ctermbg=brown guifg=white guibg=brown
highlight BadWhitespace         ctermbg=brown guifg=white guibg=brown

" Setting Italics for comments
"highlight Comment cterm=italic
"highlight Comment gui=italic
highlight htmlArg cterm=italic

" Searing red very visible cursor red back ground
hi Cursor guibg=red

function! s:highlight_general_checkstyles()
    "let w:m1=matchadd('Tab', '    ', -1)
    let w:m1=matchadd('WideSpace', '　', -1)
    let w:m2=matchadd('EOLSpace', '\s\+$', -1)
    let w:m3=matchadd('WideEisuu', '[Ａ-Ｚａ-ｚ０-９]', -1)
    "let w:m4=matchadd('SpaceAndComma', ' ,', -1)
    "let w:m5=matchadd('CommaAndNonSpace', ',[^(\\n| )]', -1)
    "let w:m6=matchadd('Tab', '\t', -1)
endf

call s:highlight_general_checkstyles()

" ------------------------------------------------------------------------------------
" handling the cursor shapes (make a straight line in INSERT mode
" ------------------------------------------------------------------------------------
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
" let s:cache_dir = '~/.vim/.cache'
" function! g:GetCacheDir(suffix)
  " return resolve(expand(s:cache_dir . '/' . a:suffix))
" endfunction

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

set tags+=~/.vim/private/tags/systags

set tags+=/usr/local/lib/erlang/lib/tags

" -------------------------------------------------------------------------------------
" set cpp includes in the path
" -------------------------------------------------------------------------------------
"set path=.,/usr/include,/usr/local/include
" included clang includes
set path=.,/usr/include,/usr/local/include,/opt/software/clang+llvm-6.0.0-x86_64-apple-darwin/include/c++/v1

" -------------------------------------------------------------------------------------
" additional path settings to include opencv
" -------------------------------------------------------------------------------------
set path+=/usr/local/opt/opencv/include

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
    "let $PYTHONPATH = "/usr/local/lib/python3.6/site-packages"
    let $PYTHON3_INCLUDE_DIR = "/usr/local/opt/python3/Frameworks/Python.framework/Versions/3.6/include/python3.6m"
    let $PYTHON3_LIBRARY = "/usr/local/opt/python3/Frameworks/Python.framework/Versions/3.6/lib/python3.6/config-3.6m-darwin"
    let $GOPATH = $HOME . "/sw/programming/gocode/go"
    let $PATH = $HOME . "/usr/local/opt/go/libexec/bin:" . $PATH
endif

" -------------------------------------------------------------------------------------
" for haskell external path setup in macvim
" -------------------------------------------------------------------------------------
if has('gui_running')
  "set path+=~/Library/Haskell/bin
  let $PATH=$PATH.':'.expand("~/Library/Haskell/bin/")
endif

" -------------------------------------------------------------------------------------
" Highlight TODO and FIXME
" http://stackoverflow.com/questions/11709965/vim-highlight-the-word-todo-for-every-filetype
" -------------------------------------------------------------------------------------
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO\|FIXME', -1)
augroup END


" italics in comments
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic gui=italic

" -------------------------------------------------------------------------------------
" Automatically reload vim config(s)
" -------------------------------------------------------------------------------------
"augroup myvimrc
"    au!
"    au BufWritePost .vimrc,vimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"augroup END
