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

  autocmd Filetype go compiler go
endif

let g:golang_onwrite = 0
let g:golang_goroot = "/Users/erik/dev/go/"

cnoreabbrev W w
cnoreabbrev E e
cnoreabbrev Q q

set undofile
set undodir="/Users/erik/.undos/

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%F

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_jshint_args = "--config ~/.jshint-config"


execute pathogen#infect()
