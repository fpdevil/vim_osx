" -----------------------------------------------------------------------------
" ----------        For Java Language                                ----------
" -----------------------------------------------------------------------------
if isdirectory(expand('~/.vim/plugged/vim-javacomplete2'))
    let g:JavaComplete_MavenRepositoryDisable = 1 "don't append classpath with libraries in pom.xml
    let g:JavaComplete_ClosingBrace           = 0
endif
