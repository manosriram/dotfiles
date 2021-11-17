set nocompatible              " be iMproved, required

filetype off                  " required
syntax on
set number
set laststatus=2
set noswapfile
set autoread
set noshowmode
set belloff=all
set noerrorbells
set visualbell
set t_vb=
filetype plugin on
set encoding=UTF-8
set bg=dark

hi Visual term=reverse cterm=reverse guibg=White
let base16colorspace=256

set backspace=indent,eol,start
set tabstop=4
set softtabstop=4 noexpandtab

set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set splitbelow
set splitright
set relativenumber
set incsearch
set noerrorbells
set nowrap
set maxmempattern=20000
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000


if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

" COC-Tab Config
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

map <Enter> o<ESC>
map <silent> <C-b> :NERDTreeFocus<CR>
map <silent> <C-n> :NERDTreeToggle<CR>
map / /\v
map z dd
map tvv :vert term<CR>
map thh :term<CR>
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

let mapleader=" "

nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap ,v <C-w>v
nnoremap ,h <C-w>s
nnoremap <C-e> :set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>
nnoremap <C-e> :set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>

"vim-sneak
let g:sneak#label = 1
let g:sneak#target_labels="abcdefghijklmnopqrstuvwxyz1234567890,./'[]"

" fzf.vim
let g:fzf_layout = { 'down': '~40%' }
map ;f :Files<CR>
map ;w :Windows<CR>

"colorscheme
colorscheme distinguished

let g:airline#extensions#tmuxline#enabled = 0
" start tmuxline even without vim running
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

"go
let g:go_auto_type_info = 1
" let g:go_imports_mode='gopls'
let g:go_gopls_enabled = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:go_info_mode='guru'
let g:go_auto_type_info='gopls'

"Tabs mapping
nnoremap <Leader>l :tabnext<CR>
nnoremap <Leader>h :tabprev<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>x :tabclose<CR>

set guicursor=i:hor25-iCursor
set guicursor+=n:block-Cursor/lCursor

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Theme
set termguicolors     " enable true colors support
highlight LineNr guifg=white
highlight Pmenu guibg=#2C3E50 gui=bold
highlight EndOfBuffer ctermfg=white

" NerdTree
let g:NERDSpaceDelims = 1
let g:NERDTreeDirArrows=0
set encoding=utf8
set t_Co=256

call plug#begin('~/.vim/plugged')

let g:user_emmet_leader_key=','

" Plugs
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master' }
Plug 'preservim/nerdcommenter'
Plug 'fatih/vim-go'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'

" Plugs come before this line.
call plug#end()
filetype plugin indent on
