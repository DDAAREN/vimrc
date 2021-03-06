autocmd FileType python setlocal et sta sw=4 sts=4 fileencoding=utf-8

function Python_header_default()
    " Add header to new python file
    let fileName = expand("%:p")
    if !filereadable(fileName)
        exec 1
        normal 0
        call setline(1, '#!/usr/bin/env python')
        call setline(2, '# _*_ coding: UTF-8 _*_')
    endif
endfunction

function Python_header_insert()
    " Manual insert header
    exec 'normal'.1.'G'
    let line = getline('.')
    if line =~ '^#!.*$'
        return
    endif
    normal 0
    normal O
    call setline('.', '#!/usr/bin/env python')
    normal o
    call setline('.', '# _*_ coding: UTF-8 _*_')
    normal o
    call setline('.', '')
    endfunction

    

au FileType python call Python_header_default() 
au FileType python map <F4> :call Python_header_insert() 
