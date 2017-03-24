set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=0
set smarttab
set noswapfile
set nowrap
set showcmd
set backspace=indent,eol,start
set smartcase
set showtabline=2
set modeline
set modelines=5
syntax on

map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-t> <C-w>v
map <C-n> <C-w>v
map <C-s> <C-w>s

function! SetupPython()
  setlocal noexpandtab shiftwidth=2 softtabstop=0 tabstop=2
endfunction

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  autocmd Filetype go compiler go

  autocmd VimEnter * set vb t_vb=
  autocmd FileType python call SetupPython()
  autocmd FileType pug call SetupPython()
  autocmd BufWritePre * :%s/\s\+$//e
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
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_python_flake8_args = "--ignore=W191,E126,E128,E501,E111,F405"
let g:python_recommended_style = 0

execute pathogen#infect()
