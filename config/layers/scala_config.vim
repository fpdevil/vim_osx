" ----------------------------------------------------------------------
" scala language support configuration
" ----------------------------------------------------------------------

"if has_key(g:plugs,'vim-scala')
if !empty(glob('~/.vim/plugged/vim-scala'))
    let g:scala_scaladoc_indent = 1
endif

"if has_key(g:plugs, 'syntastic')
if !empty(glob('~/.vim/plugged/syntastic'))
    let g:syntastic_scala_checkers = ['scalac']
    let g:syntastic_scala_checkers = ['fsc']
endif

if has('autocmd')
    function! FindClasspath(where)
        let cpf = findfile('.classpath', escape(a:where, ' ') . ';')
        let sep = syntastic#util#isRunningWindows() || has('win32unix') ? ';' : ':'
        try
            return cpf !=# '' ? [ '-classpath', join(readfile(cpf), sep) ] : []
        catch
            return []
        endtry
    endfunction

    let g:syntastic_scala_scalac_args = [
                \ '-Xfatal-warnings:false',
                \ '-Xfuture',
                \ '-Xlint',
                \ '-Ywarn-adapted-args',
                \ '-Ywarn-dead-code',
                \ '-Ywarn-inaccessible',
                \ '-Ywarn-infer-any',
                \ '-Ywarn-nullary-override',
                \ '-Ywarn-nullary-unit',
                \ '-Ywarn-numeric-widen',
                \ '-Ywarn-unused-import',
                \ '-Ywarn-value-discard',
                \ '-deprecation',
                \ '-encoding', 'UTF-8',
                \ '-feature',
                \ '-language:existentials',
                \ '-language:higherKinds',
                \ '-language:implicitConversions',
                \ '-unchecked',
                \ '-d', ($TMPDIR !=# '' ? $TMPDIR : '/tmp') ]

    augroup syntastic_scalac
        autocmd!
        autocmd FileType scala let b:syntastic_scala_scalac_args =
                    \ get(g:, 'syntastic_scala_scalac_args', []) +
                    \ FindClasspath(expand('<afile>:p:h', 1))
    augroup END
endif
