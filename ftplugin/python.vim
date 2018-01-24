" ------------------------------------------------------------------------------
"  for proper pep8 indentation
" ------------------------------------------------------------------------------
setlocal tabstop=4              " a hard TAB displays as 4 columns
setlocal softtabstop=4          " insert/delete 4 spaces when hitting a TAB/BACKSPACE
setlocal shiftwidth=4           " operation >> indents 4 columns; << unindents 4 columns
setlocal textwidth=79           " lines longer than 79 columns will be broken
setlocal expandtab              " insert spaces when hitting TABs

setlocal shiftround             " round indent to multiple of 'shiftwidth'
setlocal autoindent             " align the new line indent with the previous line

setlocal fileformat=unix

setlocal keywordprg=pydoc

setlocal makeprg=pep8\ %
setlocal commentstring=#\ %s

setlocal concealcursor=""           " disable conealing for active line
