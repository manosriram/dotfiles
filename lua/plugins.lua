local cmd = vim.cmd

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

cmd([[
  augroup PackerUserConfig
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require('dap-go').setup()

require('packer').startup(function ()
		use 'scrooloose/nerdtree'
		use 'flazz/vim-colorschemes'
		use {
				'prettier/vim-prettier',
				run = 'npm install',
		}
		use 'mattn/emmet-vim'
		use 'Chiel92/vim-autoformat'
		use { 'junegunn/fzf',  dir = '~/.fzf', run = './install --all' }
		use 'junegunn/fzf.vim'
		use { 'neoclide/coc.nvim', branch = 'release' }
		-- use 'nvim-telescope/telescope.nvim'
		-- use 'nvim-lua/popup.nvim'
		-- use 'nvim-lua/plenary.nvim'

		use 'mfussenegger/nvim-dap'
		use 'leoluz/nvim-dap-go'
		use 'mfussenegger/nvim-dap-python'

		use 'preservim/nerdcommenter'
		use 'fatih/vim-go'
		use 'tpope/vim-surround'
		use 'itchyny/lightline.vim'
		use 'ggandor/lightspeed.nvim'
		-- use "https://github.com/mfussenegger/nvim-dap"
		use { 'puremourning/vimspector' }
		use "https://github.com/rcarriga/nvim-dap-ui"
		use { 'mbbill/undotree' }
		use 'nvim-lua/plenary.nvim'
		use 'theprimeagen/harpoon'
		use {
				'numToStr/Navigator.nvim',
				config = function()
						require('Navigator').setup()
		end
}
end)
