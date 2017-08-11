" quickly highlight the selected word <cword>
"
if has_key(g:plugs, 'vim-quickhl')
    nmap <Space>m <Plug>(quickhl-manual-this)
    xmap <Space>m <Plug>(quickhl-manual-this)
    
    nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
    xmap <Space>w <Plug>(quickhl-manual-this-whole-word)
    
    nmap <Space>M <Plug>(quickhl-manual-reset)
    xmap <Space>M <Plug>(quickhl-manual-reset)
    
    nmap <Space>j <Plug>(quickhl-cword-toggle)
    nmap <Space>] <Plug>(quickhl-tag-toggle)
    map H <Plug>(operator-quickhl-manual-this-motion)
endif
