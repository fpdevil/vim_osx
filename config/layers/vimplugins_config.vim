"{{{ Vim plug-ins which offer support for various programming languages
if !empty(glob('~/vim_osx/plugged/c-support'))
    " for c-support
    " insert c template header and enable tools
    " http://www.thegeekstuff.com/2009/01/tutorial-make-vim-as-your-cc-ide-using-cvim-plugin
    let g:C_CustomTemplateFile = '~/.vim/c-support/templates/c.templates'
    let g:C_CodeSnippets       = '~/.vim/c-support/codesnippets/'
    let g:C_UseTool_cmake      = 'yes'
    let g:C_UseTool_doxygen    = 'yes'
    let g:C_Styles             = {
                \ '*.c,*.h' : 'C',
                \ '*.cc,*.cpp,*.c++,*.C,*.hh,*.h++,*.H' : 'CPP'
                \ }
endif
"}}}
