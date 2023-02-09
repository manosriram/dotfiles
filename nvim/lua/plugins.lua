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
		use 'mattn/emmet-vim'
		use 'Chiel92/vim-autoformat'
		use { 'junegunn/fzf',  dir = '~/.fzf', run = './install --all' }
		use 'junegunn/fzf.vim'

		use 'mfussenegger/nvim-dap'
		use 'leoluz/nvim-dap-go'
		use 'mfussenegger/nvim-dap-python'
		use "https://github.com/rcarriga/nvim-dap-ui"

		use 'preservim/nerdcommenter'
		use 'fatih/vim-go'
		use 'tpope/vim-surround'
		use 'itchyny/lightline.vim'
		use 'ggandor/lightspeed.nvim'
		-- use "https://github.com/mfussenegger/nvim-dap"

		use { 'mbbill/undotree' }
		use 'nvim-lua/plenary.nvim'
		use 'theprimeagen/harpoon'
		use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
      }
    }
		use {
				'numToStr/Navigator.nvim',
				config = function()
						require('Navigator').setup()
		end
}
end)
