" ------------------------------------------------------------------------------
"  for proper pep8 indentation
" ------------------------------------------------------------------------------
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent

setlocal fileformat=unix

setlocal keywordprg=pydoc

setlocal makeprg=pep8\ %
setlocal commentstring=#\ %s
