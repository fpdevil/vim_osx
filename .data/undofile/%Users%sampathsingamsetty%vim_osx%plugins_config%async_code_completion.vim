Vim�UnDo� ���N篳��F�k���*������^���k�n�                                     Y~�f    _�                             ����                                                                                                                                                                                                                                                                                                                                                             Yy��     �                   5�_�                            ����                                                                                                                                                                                                                                                                                                                                                        Yy��    �                  X  " ------------------------------------------------------------------------------------   X  " ---- vim async code completion settings                                         ----   X  " ------------------------------------------------------------------------------------   ! if (!has('gui_running'))   N!     if filereadable(expand("~/.vim/plugged/completor/plugin/completor.vim"))   E!         let g:completor_python_binary    = "/usr/local/bin/python3"   B!         let g:completor_node_binary      = "/usr/local/bin/node"   =!         let g:completor_clang_binary     = "/usr/bin/clang"   O!         let g:completor_gocode_binary    = "/usr/local/opt/go/libexec/bin/go"   Q!         let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'   @!         " Use Tab to trigger completion (disable auto trigger)   .!         " let g:completor_auto_trigger   = 0   P+         " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"   +     endif     endif5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Y~�X     �                       �             5�_�                       "    ����                                                                                                                                                                                                                                                                                                                                                             Y~�[     �               $    if has_key(g:plugs, 'ultisnips')5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Y~�e    �                L    if filereadable(expand("~/.vim/plugged/completor/plugin/completor.vim"))5��