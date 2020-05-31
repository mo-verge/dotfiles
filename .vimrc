set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'kopischke/vim-stay'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'morhetz/gruvbox'

Plugin 'scrooloose/nerdcommenter'

Plugin 'Valloric/YouCompleteMe'

Plugin 'nvie/vim-flake8'

Plugin 'scrooloose/nerdtree'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'jeffkreeftmeijer/vim-numbertoggle'

Plugin 'nginx.vim'

Plugin 'mileszs/ack.vim'

Plugin 'vim-airline/vim-airline'

" Plugin 'gregsexton/MatchTag'
"Plugin 'christoomey/vim-titlecase'
"Plugin 'scrooloose/syntastic'
"Plugin 'leafgarland/typescript-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Enable Mouse
set mouse=a

" Ctags check for tags file all the way to root 
set tags=tags;/

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

set hidden
set tabstop=8
set softtabstop=0
set shiftwidth=4
set textwidth=99
set expandtab
set smarttab
set autoindent
set fileformat=unix

au BufNewFile,BufRead *.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

autocmd FileType yaml execute  ':silent! %s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'

let g:ycm_python_binary_path = 'python3'

let g:syntastic_python_python_exec = 'python3'


" set colorscheme
set background=dark
colorscheme gruvbox

" set highlighting and autocomplete
let python_highlight_all=1
syntax on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set laststatus=2

set encoding=utf-8
let g:airline_powerline_fonts=1
let g:Powerline_symbols = 'fancy'

" Spell check
setlocal spell spelllang=en_us
set complete+=kspell

set number relativenumber

autocmd BufRead,BufNewFile /etc/nginx/sites-*/* setfiletype conf

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py' 
let g:ycm_show_diagnostics_ui = 0

" #####################
" #  Setting key maps #
" #####################
"
" Set highlight 

nnoremap <F6> :set hlsearch!<CR>
nnoremap <F7> :set nonu! nornu!<CR>
nnoremap <F8> :tab split<CR>

" Paste mode toggle

set pastetoggle=<F5>

" NerdTree toggle
map <C-l> :NERDTreeToggle<CR>

" disable increment and decrement maps
map <C-a> <Nop>
map <C-x> <Nop>
