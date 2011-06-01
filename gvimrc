if has("win32") || has("win64")
    source $VIM\_vimrc
else
    source ~/.vimrc
endif    

autocmd GUIEnter * winpos -4 -4
autocmd GUIEnter * set lines=40 columns=108

if has("win32") || has("win64")
    autocmd GUIEnter * simalt ~x
    set shell=C:\WINDOWS\system32\cmd.exe
endif

set vb t_vb=

if has("win32") || has("win64")
    set guifont=DejaVu_Sans_Mono:h16:cANSI
else
    set guifont=DejaVu\ Sans\ Mono\ 15
endif   

map <silent> <C-F12> :call ProgUtils#OpenFileExplorer(expand('%:p:h'))<CR>
imap <silent> <C-F12> <Esc>:call ProgUtils#OpenFileExplorer(expand('%:p:h'))<CR>a
