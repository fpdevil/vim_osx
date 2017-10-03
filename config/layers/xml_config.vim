au BufRead,BufNewFile *.xml set expandtab
au BufRead,BufNewFile *.xml set tabstop=4
au BufRead,BufNewFile *.xml set softtabstop=4
au BufRead,BufNewFile *.xml set shiftwidth=4
au BufRead,BufNewFile *.xml set autoindent
au BufRead,BufNewFile *.xml match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.xml match BadWhitespace /\s\+$/
au         BufNewFile *.xml set fileformat=unix
au BufRead,BufNewFile *.xml let b:comment_leader = '<!--'

let g:xml_syntax_folding=1
autocmd FileType xml setlocal foldmethod=syntax
autocmd FileType xml setlocal tabstop=4
autocmd FileType xml setlocal softtabstop=4
autocmd FileType xml setlocal shiftwidth=4

" type gg=G for formatting
let $XMLLINT_INDENT="    "
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
