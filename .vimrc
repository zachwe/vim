set nocompatible              " be iMproved
filetype off                  " required for vundle

let mapleader=","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Sensible vim defaults
Plugin 'tpope/vim-sensible'

" For surrounding text with stuff like a boss
Plugin 'tpope/vim-surround'

" Completion
" Probably need to update vim for this to work right
" Plugin 'Valloric/YouCompleteMe'

" ===== Language and format specific plugins =====-

" Go
Plugin 'fatih/vim-go'

" JSON
Plugin 'tpope/vim-jdaddy'
" Jsonnet
Plugin 'google/vim-jsonnet'

" Syntastic syntax checker
Plugin 'vim-syntastic/syntastic'

" Git plugin
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'

" Ctrl-p fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'

" Colorschemes
Plugin 'flazz/vim-colorschemes'

" Clojure REPL
Plugin 'tpope/vim-fireplace'
Plugin 'paredit.vim'
call vundle#end()            " required
filetype plugin indent on    " required
colorscheme solarized

set nocp
set backspace=2


set showcmd
syntax enable
set grepprg=git\ grep\ $*
nnoremap gr :grep <cword> *<CR>

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
set textwidth=80
set fo+=t

"Make it real easy to switch tab lengh and space length
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
" Wrap after enough columns
" nmap \w :setlocal wrap!<CR>:setlocal wrap<CR>

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

filetype indent plugin on
syntax on

set runtimepath+=~/.vim/bundle/jshint2.vim/

" ejs files should just look like html
au BufNewFile,BufRead *.ejs set filetype=html

" Display filename
set laststatus=2
set statusline=
set statusline+=%F

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ %p%%

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ["python", "flake8"]
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_python_checker_args='--ignore=E402,E302'
let g:syntastic_python_flake8_post_args='--ignore=E501,E402,E302,E261'
" let g:syntastic_javascript_eslint_args = ["-c ~/analytcs/.eslintrc.json"]
" Cpp linting 
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_include_dirs = ['$HOME/analytics/backend/common', 'third_party']

" Ctrl-P settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 0
" prioritize current file
let g:ctrlp_working_path_mode = 'c'
" Go to an already open window
let g:ctrlp_switch_buffer = 'ET'
" Use per-session caching
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" Don't even limit the number of files to scan
let g:ctrlp_max_files = 0
let g:ctrlp_lazy_update = 100
" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Refresh files when they are changed (this is useful when doing things with
" git while files are open)
set autoread

set background=dark

" Save when switching buffers
set autowrite

cabbr <expr> %% expand('%:p:h')

set omnifunc=syntaxcomplete#Complete

" set vim path
let &path.="$HOME/analytics/backend/third_party,$HOME/analytics/backend/common,"

" Mapping for comments
" This actually maps <c-/>
" https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
vnoremap <c-_> I// <ESC>

" wrap lines on screen
set wrap
