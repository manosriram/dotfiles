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
set diffopt+=vertical
filetype plugin on
set encoding=UTF-8


if (executable('rg'))
    let g:rg_derive_root = 'true'
endif

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = ' ag %s -l --nocolor -g ""'
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
map ; :Files<CR>
map / /\v
map z dd
map tvv :vert term<CR>
map thh :term<CR>

colorscheme cinnabar

let mapleader=" "

nmap <leader>gs :G<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>

noremap <Leader>\t :botright vertical terminal
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap ,v <C-w>v
nnoremap ,h <C-w>s

"Easy-Motion Mappings
nnoremap <Leader>f H:call EasyMotion#WB(0, 0)<CR>
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_smartcase = 1

"Tabs mapping
nnoremap tn :tabnew<Space>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

"vim-go config
let g:go_fmt_autosave=0

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Theme config
set termguicolors     " enable true colors support
set background=dark
highlight LineNr guifg=white
highlight Pmenu guibg=#2C3E50 gui=bold
highlight EndOfBuffer ctermfg=white

let g:NERDSpaceDelims = 1
let g:NERDTreeDirArrows=0
set rtp+=~/.vim/bundle/Vundle.vim
set encoding=utf8
set t_Co=256

call vundle#begin()

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
set ttimeout
set ttimeoutlen=50
set timeoutlen=3000
set maxmempattern=20000

let g:user_emmet_leader_key=','

" Prettier Config
autocmd BufWritePre *.js,*.ts,*.jsx,*.mjs,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Vundle Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'mattn/emmet-vim'
Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
Plugin 'Chiel92/vim-autoformat'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'easymotion/vim-easymotion'
Plugin 'vimoxide/vim-cinnabar'
Plugin 'preservim/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'

let g:airline_theme='molokai'

" Plugins come before this line.
call vundle#end()
filetype plugin indent on
