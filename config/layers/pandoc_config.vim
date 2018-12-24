""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-pandoc                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"augroup pandoc_syntax
"    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
"    au! BufNewFile,BufFilePre,BufRead *.markdown set filetype=markdown.pandoc
"augroup END

let g:pandoc#filetypes#handled = ['pandoc', 'markdown']
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#codeblocks#embeds#langs = [
            \ 'python', 'vim', 'make',
            \ 'bash=sh', 'html', 'css', 
            \ 'scss', 'javascript'
            \ ]
let g:pandoc#modules#disabled = ['folding']

