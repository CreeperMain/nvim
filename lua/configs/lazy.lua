--boot strapping lazy pkg manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- adding plugins
require('lazy').setup({
-- color scheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
-- tree sitter bit
{	
	"nvim-treesitter/nvim-treesitter", 
	build = ":TSUpdate",
},
{
	'nvim-treesitter/playground',
},
-- lsp stuff
{
	'VonHeikemen/lsp-zero.nvim', 
	branch = 'v3.x',
	dependencies = {
		--lsp support
		{'neovim/nvim-lspconfig'},
			--mason stuff
			{'williamboman/mason.nvim'},
	 		{'williamboman/mason-lspconfig.nvim'},
		--autocompletion
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/nvim-cmp'},
		{'L3MON4D3/LuaSnip'},
			}
},
-- file nav
	--harpoon
	{'ThePrimeagen/harpoon'},
	--telescope
	{
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    	},
	--nvim-tree
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
},
-- git
  { "kdheepak/lazygit.nvim" },
  { "airblade/vim-gitgutter" },
--misc
{
	--gentoo syntax
'gentoo/gentoo-syntax',
	--tmux windows switching
'christoomey/vim-tmux-navigator',
	--unto tree
'mbbill/undotree', --look into this
	--preview color
'uga-rosa/ccc.nvim',
	--vim fugitive 
'tpope/vim-fugitive',
}
		})
