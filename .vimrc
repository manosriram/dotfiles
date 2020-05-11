set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set number
set laststatus=2
set noswapfile
set autoread
set noshowmode

filetype plugin indent on
filetype indent on
set smartindent
set autoindent

if (executable('rg'))
    let g:rg_derive_root = 'true'
endif

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = ' ag %s -l --nocolor -g ""'
endif

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

map <Enter> o<ESC>
map <silent> <C-b> :NERDTreeFocus<CR>
map <silent> <C-n> :NERDTreeToggle<CR>
map ; :Files<CR>

noremap <Leader>\t :botright vertical terminal
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap ,v <C-w>v
nnoremap ,h <C-w>s

" lightline config
let g:lightline = {
    \ 'colorscheme': 'gruvbox'
    \ }

let g:NERDTreeDirArrows=0
set rtp+=~/.vim/bundle/Vundle.vim

set encoding=utf8
set t_Co=256

call vundle#begin()

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark
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

let g:user_emmet_leader_key=','
let base16colorspace=256
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 

" Vundle Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'git@github.com:Valloric/YouCompleteMe.git'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'mattn/emmet-vim'
Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
Plugin 'Chiel92/vim-autoformat'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'

" Plugins come before this line.
call vundle#end()
filetype plugin indent on
