local cmd = vim.cmd
local g = vim.g

function map(mode, shortcut, command, noremap)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = noremap, silent = true })
end

function nrmap(shortcut, command)
    map('n', shortcut, command, false)
end

function nmap(shortcut, command)
    map('n', shortcut, command, true)
end

function imap(shortcut, command)
    map('i', shortcut, command, true)
end

-- Highlight coloring
cmd('hi Visual cterm=NONE ctermbg=0 ctermfg=NONE')
cmd('hi Search cterm=NONE ctermbg=0 ctermfg=white')
cmd('hi Pmenu cterm=NONE ctermbg=white ctermfg=0')
cmd('hi MatchParen cterm=NONE ctermbg=NONE ctermfg=green')
cmd([[
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
	set guicursor=i:hor25-iCursor
	set guicursor+=n:block-Cursor/lCursor

	set bg=dark
	set background=dark
	colorscheme jellybeans
	let g:gruvbox_contrast_dark = 'hard'

	hi Visual term=reverse cterm=reverse guibg=White
	let base16colorspace=256

	set backspace=indent,eol,start
	set tabstop=2 softtabstop=4 shiftwidth=4
	set noexpandtab
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
	set t_Co=256
	set termguicolors     " enable true colors support
	highlight LineNr guifg=white
	highlight Pmenu guibg=#2C3E50 gui=bold
	highlight EndOfBuffer ctermfg=white
]])

g.go_doc_keywordprg_enabled = 0
g.go_auto_type_info = 1
g.to_imports_mode = 'gopls'
g.go_gopls_enabled = 1
g.ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
g.go_info_mode = 'guru'
g.go_auto_type_info = 'gopls'
g.NERDSpaceDelims = 1
g.NERDTreeDirArrows = 0
g.user_emmet_leader_key=','
vim.api.nvim_set_keymap("n", "F", "<Plug>Lightspeed_S", { noremap = false, silent = true })
vim.cmd("let g:lightline = {'colorscheme': 'simpleblack'}")
