" -----------------------------------------------------------------------------
"  vim plantuml diagram support
" -----------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.pu,*.uml,*.plantuml setfiletype plantuml | set filetype=plantuml

if has_key(g:plugs, 'plantuml-syntax')
    let g:plantuml_executable_script = "$HOME/.vim/private/plantuml/uml.sh"
endif

" :w -> save and generate diagram above the @startuml
" :make -> will generate a .png with same name as file
