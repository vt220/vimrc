set nocompatible
syntax enable
filetype plugin indent on
colorscheme delek 

set nowrap
set nobackup
set noswapfile
set guioptions=a
set guicursor=a:blinkon0
set softtabstop=4
set shiftwidth=4
set ruler
set expandtab
set hlsearch
set hidden
set showcmd
set fileformat=unix
set incsearch
set shortmess+=I
set tags=./tags;

if has("win32") || has("win64")
    set csprg=C:\Program\ Files\cscope\cscope.exe
else
    set csprg=/usr/bin/cscope
endif     

set cscopetag
set nocscopeverbose
set csto=1
set cspc=3


map <Leader>cd :cd %:p:h<CR>
map <C-Right> zl
map <C-Left>  zh
map <A-Right> zL
map <A-Left>  zH
map <C-Up> <C-Y>
map <C-Down> <C-E>


let g:bufExplorerShowUnlisted=1
let g:bufExplorerSortBy='name'

