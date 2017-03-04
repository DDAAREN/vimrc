autocmd FileType lua setlocal et sta sw=4 sts=4 fileencoding=utf-8

function Lua_header_default()
    " Add header to new python file
    let fileName = expand("%:p")
    if !filereadable(fileName)
        exec 1
        normal 0
        call setline(1, '#!/usr/bin/env lua')
        normal o
    endif
endfunction

au FileType lua call Lua_header_default() 
