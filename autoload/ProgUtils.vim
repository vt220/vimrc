
function! ProgUtils#OpenFileExplorer(path)
    let pathToOpen = getcwd()

    if a:path != ""
        let pathToOpen = a:path
    endif

    if has("win32") || has("win64")
        let command = 'explorer /e,/select,' . '"' . pathToOpen . '"' 
    else        
        let command = 'nautilus ' . '"' . pathToOpen . '"' 
    endif

    call system(command)
endfunction



let s:loadedCscopeDatbase = 0

function! ProgUtils#LoadCscopeDatabase()
    if s:loadedCscopeDatbase
        return
    endif

    exe "cs kill -1"

    let dbPath = findfile("cscope.out", ".;")
    if dbPath == ""
        return
    endif
    
    let dbDir = fnamemodify(dbPath, ":h")

    exe "cscope add " . dbPath . " " . dbDir

    let s:loadedCscopeDatbase = 1

endfunction



function! ProgUtils#FindTag() 

    call ProgUtils#LoadCscopeDatabase()
    
    try
        execute "cstag " . expand("<cword>")
    catch /Vim(cstag):E257/
        let errString = substitute(v:exception, "Vim(cstag):", "", "")
        echohl ErrorMsg
        echo errString
        echohl None
    endtry

endfunction    


function! ProgUtils#FindTagVisual() 

    call ProgUtils#LoadCscopeDatabase()

    let aReg = @a
    normal gv"ay
    let selectedText = @a
    let @a = aReg
    
    try 
        execute "cstag " . selectedText
    catch /Vim(cstag):E257/
        let errString = substitute(v:exception, "Vim(cstag):", "", "")
        echohl ErrorMsg
        echo errString
        echohl None
    endtry

endfunction    
