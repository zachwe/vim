" Don't be compatible with vi.
set nocompatible
set backspace=2


set showcmd
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

set autoindent


" nice indentation for Python
set incsearch
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab " no tab characteres please
set smarttab
set shiftround " round indent to multiple of 'shiftwidth'
set autoindent " align the new line indent with the previous line 

" PEP line width
set textwidth=79

"Make it real easy to switch tab lengh and space length
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
" Wrap after enough columns
nmap \w :setlocal wrap!<CR>:setlocal wrap<CR>

" Ignore file extensions in autocomplete
set wildignore=*.swp,*.bak,*.pyc,*.class

" Move down a line visually even when a line is long
nmap j gj
nmap k gk

" We don't want to have to display every buffer
set hidden

set wildmenu
set wildmode=list:longest,full

set number

" ===Search smarter===
"
" ignores case except when you use uppercase. 
set ignorecase
set smartcase
" highlight as you search
set incsearch
set hlsearch
" But be able to get rid of that highlight.
nmap \q :nohlsearch<CR>

" Create folds for indents
" set foldmethod=indent
set foldmethod=syntax

filetype indent plugin on
syntax on

set runtimepath+=~/.vim/bundle/jshint2.vim/

" pathogen allows for really easy managing of vim plugins.
execute pathogen#infect()

" ejs files should just look like html
au BufNewFile,BufRead *.ejs set filetype=html

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ["python", "flake8"]
" let g:syntastic_python_flake8_quiet_messages = {"regex": '(\[E501\])|(\[E302\])|(\[E402\])'}
let g:syntastic_python_flake8_args = "--ignore E501,E302,E402,E261"

" Ctrl-P settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 0

" Refresh files when they are changed (this is useful when doing things with
" git while files are open)
set autoread

" set background=light
" colorscheme elflord
" colorscheme solarized
colorscheme morning
