" -----------------------------------------------------------------------------
" --       XML specific settings - formatting and syntax checking            --
" -----------------------------------------------------------------------------

au BufRead,BufNewFile *.xml,*.xsl$ set expandtab
au BufRead,BufNewFile *.xml,*.xsl$ set tabstop=4
au BufRead,BufNewFile *.xml,*.xsl$ set softtabstop=4
au BufRead,BufNewFile *.xml,*.xsl$ set shiftwidth=4
au BufRead,BufNewFile *.xml,*.xsl$ set autoindent
au BufRead,BufNewFile *.xml,*.xsl$ match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.xml,*.xsl$ match BadWhitespace /\s\+$/
au         BufNewFile *.xml,*.xsl$ set fileformat=unix
au BufRead,BufNewFile *.xml,*.xsl$ let b:comment_leader = '<!--'

let g:xml_syntax_folding=1

augroup XmlFT
	autocmd!
	autocmd FileType xml,*.xsl$ setlocal foldmethod=syntax
	autocmd FileType xml,*.xsl$ setlocal tabstop=4
	autocmd FileType xml,*.xsl$ setlocal softtabstop=4
	autocmd FileType xml,*.xsl$ setlocal shiftwidth=4
augroup END


" -----------------------------------------------------------------------------
" type gg=G for formatting
" XMLLINT_INDENT set to 4 spaces which did not work, so have to set below in
" my .bash_profile sources in .zsh
" Use export XMLLINT_INDENT="^I" (i.e. ctrl+v, ctrl+i)
" -----------------------------------------------------------------------------
let $XMLLINT_INDENT='	'
"set equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
au FileType xml,*.xsl$ setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
au FileType xsl exe ":silent 1,$!XMLLINT_INDENT='    ' xmllint --format --recover - 2>/dev/null"

" -----------------------------------------------------------------------------
" XMLLINT settings
" This script adds :XLTAB and :XNSCLEAN as quick XML tidy commands, which are
" based on xmllint. :XLTAB runs xmllint --format using tab indentation (unless
" you change g:xmllint_indent). It also ditches redundant namespaces, recodes
" to UTF-8, and tells you where you screwed up (at which point you undo, make
" corrections, and rerun). :XNSCLEAN does the same without reindenting.
"
" All caveats concerning xmllint apply.
" -----------------------------------------------------------------------------
let g:xmllint_indent =  '   	'
let g:xmllint="XMLLINT_INDENT='" . g:xmllint_indent . "' xmllint --encode UTF-8"

function! Run_xmllint_command(cmd)
	"/bin/zsh" "%!" . g:xmllint . " " . a:cmd
	"set ft=xml
	set fileencoding=utf8
	set ts=4 sw=4
endfunction

function! Run_xmllint_format()
	call Run_xmllint_command("--encode UTF-8 --format --recover --nsclean -")
endfunction
command! XLTAB call Run_xmllint_format()

function! Run_xmllint_format_to_ascii()
	call Run_xmllint_command("--encode US-ASCII --format --recover --nsclean -")
endfunction
command! XMLLINTASCII call Run_xmllint_format_to_ascii()

function! Run_xmllint_noblanks()
	call Run_xmllint_command("--encode UTF-8 --noblanks --recover --nsclean -")
endfunction
command! XNOBLANKS call Run_xmllint_noblanks()

function! Run_xmllint_canon()
	call Run_xmllint_command("--encode UTF-8 --c14n --recover --nsclean -")
endfunction
command! XCANON call Run_xmllint_canon()

function Run_xmllint_nsclean()
	call Run_xmllint_command("--encode UTF-8 --nsclean -")
endfunction
command! XNSCLEAN call Run_xmllint_nsclean()
