set number
set autoindent
set tabstop=2
set shiftwidth=4
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

" Old python setup no expand code
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
  autocmd BufWritePre * :%s/\s\+$//e
endif

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

let g:golang_onwrite = 0
let g:golang_goroot = "/Users/erik/dev/go/"

cnoreabbrev W w
cnoreabbrev E e
cnoreabbrev Q q
command W w

set undofile
set undodir="/Users/erik/.undos/

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%F
set re=0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_jshint_args = "--config ~/.jshint-config"
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_python_flake8_args = "--ignore=E111,E123,E124,E126,E127,E128,E265,E302,E501,E711,F405,F403,W191"
let g:syntastic_java_checkers = ['checkstyle']
let g:python_recommended_style = 0
let g:vim_markdown_folding_disabled = 1
map <C-a> <Nop>

execute pathogen#infect()
