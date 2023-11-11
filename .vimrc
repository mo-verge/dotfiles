set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin()

Plug 'kopischke/vim-stay'

Plug 'vim-scripts/indentpython.vim'

Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdcommenter'

Plug 'nvie/vim-flake8'

Plug 'scrooloose/nerdtree'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-fugitive'

Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'mileszs/ack.vim'

Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
  nnoremap <silent> <leader>. :AgIn 

  nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
  endfunction
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
" }}}


call plug#end()

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
