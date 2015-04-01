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
syntax on

map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-t> <C-w>v
map <C-n> <C-w>v
map <C-s> <C-w>s

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

autocmd Filetype go compiler go
let g:golang_onwrite = 0
let g:golang_goroot = "/Users/erik/dev/go/"

execute pathogen#infect()
