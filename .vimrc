set number
set autoindent
set tabstop=2
set shiftwidth=2
set noswapfile
set expandtab
set nowrap
set showcmd
set backspace=indent,eol,start
set smartcase
set showtabline=2 

cnoreabbrev W w
cnoreabbrev E e
cnoreabbrev Q q
cnoreabbrev WQ wq
syntax on

map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-t> <C-w>v
map <C-n> <C-w>v
map <C-s> <C-w>s

autocmd Filetype go compiler goland
let g:golang_onwrite = 0
let g:golang_goroot = "/home/erik/go"

execute pathogen#infect()
