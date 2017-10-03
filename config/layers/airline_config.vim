"=============================================================================
" vim airline - use unite-airline_themes plugin for previewing the airline
" themes with the below command
" :Unite airline_themes -auto-preview -winheight=12
"
"=============================================================================
scriptencoding utf-8

if has_key(g:plugs,'vim-airline')
    "{{{ vim powerline symbols to be shown in the statusbar
    let g:Powerline_symbols       = 'unicode'           " fancy | unicode
    let g:airline_powerline_fonts = 1
        " status line and vim-airline
    set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
    "}}}

    "{{{ for fugitive
    if exists("*fugitive#statusline")
        set statusline+=%{fugitive#statusline()}
    endif
    "}}}

    "{{{ enable/disable the airline extensions
    let g:airline#extensions#syntastic#enabled      = 1
    let g:airline#extensions#branch#enabled         = 1
    let g:airline#extensions#tagbar#enabled         = 1
    let g:airline#extensions#tabline#enabled        = 1
    let g:airline#extensions#tabline#fnamemod       = ':t'
    let g:airline#extensions#tabline#fnamecollapse  = 1
    let g:airline#extensions#tabline#fnametruncate  = 0
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#hunks#non_zero_only    = 0                  " remove extra space with +/-/~ of 0
    let g:airline#extensions#hunks#enabled          = 1
    let g:airline#extensions#vimagit#enabled        = 1
    let g:airline#extensions#promptline#enabled     = 1
    let g:airline#extensions#unicode#enabled        = 1
    let g:airline#extensions#tabline#formatter      = 'unique_tail_improved'
    let g:airline#extensions#tabline#show_tab_nr    = 1
    let g:airline#extensions#tabline#tab_nr_type    = 2
    let g:airline#extensions#tabline#show_tab_type  = 1
    let g:airline#extensions#tabline#buffers_label  = 'BUFFERS'
    let g:airline#extensions#tabline#tabs_label     = 'TABS'
    let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
    let g:airline#extensions#quickfix#location_text = 'Location'
    let g:airline#extensions#bufferline#enabled     = 1
    "}}}

    "{{{ tmux status extension for mode colors
    let g:airline#extensions#tmuxline#enabled      = 1
    let airline#extensions#tmuxline#color_template = 'normal'
    let airline#extensions#tmuxline#color_template = 'insert'
    let airline#extensions#tmuxline#color_template = 'visual'
    let airline#extensions#tmuxline#color_template = 'replace'
    "}}}

    "{{{ custom settings
    let g:airline_skip_empty_sections               = 1
    let g:airline_section_y                         = 'βη: %{bufnr("%")}'
    let g:airline_detect_paste                      = 1                     " show PASTE in paste mode
    "}}}

    "{{{ configure which mode colors should ctrlp window use (takes effect
    "    only if the active airline theme doesn't define ctrlp colors)
    let g:airline#extensions#ctrlp#color_template            = 'insert'
    let g:airline#extensions#ctrlp#color_template            = 'normal'
    let g:airline#extensions#ctrlp#color_template            = 'visual'
    let g:airline#extensions#ctrlp#color_template            = 'replace'
    "}}}

    "{{{ using the powerline fonts for vim-airline to display the glyphs
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbol setup
    " set options based on powerline font availability
    if !exists('g:airline_powerline_fonts')
        let g:airline#extensions#tabline#left_sep     = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'
        let g:airline_left_sep                        = '▶'
        let g:airline_left_alt_sep                    = '»'
        let g:airline_right_sep                       = '◀'
        let g:airline_right_alt_sep                   = '«'
        let g:airline#extensions#branch#prefix        = '⤴' "➔, ➥, ⎇
        let g:airline#extensions#readonly#symbol      = '⊘'
        let g:airline#extensions#linecolumn#prefix    = '¶'
        let g:airline#extensions#paste#symbol         = 'ρ'
        let g:airline_symbols.linenr                  = '␊'
        let g:airline_symbols.branch                  = '⎇'
        let g:airline_symbols.paste                   = '𝓟'
        let g:airline_symbols.whitespace              = 'Ξ'
        let g:airline_symbols.notexists               = '∄'
        let g:airline_symbols.crypt                   = '🔒 '
    else
        let g:airline#extensions#tabline#left_sep     = ''
        let g:airline#extensions#tabline#left_alt_sep = ''
        " powerline symbols
        let g:airline_left_sep                        = ''
        let g:airline_left_alt_sep                    = ''
        let g:airline_right_sep                       = ''
        let g:airline_right_alt_sep                   = ''
        let g:airline_symbols.branch                  = ''
        let g:airline_symbols.readonly                = ''
        let g:airline_symbols.linenr                  = ''
    endif
    "}}}

    " ------------------------------------------------------------------------------------
    " /////////////  FANCY abcdefgh in status bar (copied from airline blog) ////////////
    " ------------------------------------------------------------------------------------
    function! AccentDemo()
        let keys = ['S','a','M','p','A','t','H']
        for k in keys
            call airline#parts#define_text(k, k)
        endfor
        call airline#parts#define_accent('S', 'red')
        call airline#parts#define_accent('a', 'green')
        call airline#parts#define_accent('M', 'blue')
        call airline#parts#define_accent('p', 'yellow')
        call airline#parts#define_accent('A', 'orange')
        call airline#parts#define_accent('t', 'purple')
        call airline#parts#define_accent('H', 'bold')
        let g:airline_section_a = airline#section#create(keys)
    endfunction
    autocmd VimEnter * call AccentDemo()
endif
