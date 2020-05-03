set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set number
set laststatus=2
set noswapfile
set autoread

filetype plugin indent on
filetype indent on
set smartindent

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = ' ag %s -l --nocolor -g ""'
endif

map <Enter> o<ESC>
map <silent> <C-b> :NERDTreeFocus<CR>
map <silent> <C-n> :NERDTreeToggle<CR>
noremap <Leader>\t :botright vertical terminal

let g:NERDTreeDirArrows=0
set rtp+=~/.vim/bundle/Vundle.vim

set t_Co=256
set background=dark

call vundle#begin()

colorscheme spacegray
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1
let g:rehash256 = 1

hi Visual term=reverse cterm=reverse guibg=White
let base16colorspace=256
set backspace=indent,eol,start
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set splitbelow
set splitright
set relativenumber
set incsearch

let g:user_emmet_leader_key=','

let base16colorspace=256
 
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

let g:airline_theme='monochrome'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 

set ttimeout
set ttimeoutlen=50
set timeoutlen=3000


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'git@github.com:kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Chiel92/vim-autoformat'
Plugin 'flazz/vim-colorschemes'
Plugin 'mattn/emmet-vim'
Plugin 'prettier/vim-prettier', { 'do': 'npm install' }

" Airline Settings.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve "removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

