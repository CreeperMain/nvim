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
require("lazy").setup({
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
		"nvim-treesitter/playground",
	},
	-- lsp stuff
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			--lsp support
			{ "neovim/nvim-lspconfig" },
			--mason stuff
			{ "williamboman/mason.nvim", dependencies = {
				"WhoIsSethDaniel/mason-tool-installer.nvim",
			} },
			{ "williamboman/mason-lspconfig.nvim" },
			--autocompletion
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"hrsh7th/nvim-cmp",
				event = "InsertEnter",
				dependencies = {
					"hrsh7th/cmp-buffer", --source for text in buffer
					"hrsh7th/cmp-path", --source for file system paths in commands
					"saadparwaiz1/cmp_luasnip", -- for lua autocomp
					--snippets
					"L3MON4D3/LuaSnip", --snipet engine
					"rafamadriz/friendly-snippets", --useful snippets library
				},
			},
		},
	},
	-- file nav
	--harpoon
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	--telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
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
			require("nvim-tree").setup({})
		end,
	},
	-- git
	{ "kdheepak/lazygit.nvim", event = "VeryLazy" },
	{ "airblade/vim-gitgutter" },
	-- dap
	{
		"mfussenegger/nvim-dap",
	},
	{
		"mfussenegger/nvim-dap-python",
		event = "VeryLazy",
		ft = "python",
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
	},
	-- auto closing brackets
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- blankline indentation
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- neorg
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		ft = "norg", -- lazy load on filetype
		cmd = "Neorg", -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
		--  (you could also just remove both lazy loading things)
		priority = 30, -- treesitter is on default priority of 50, neorg should load after it.
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	--misc
	{
		--gentoo syntax
		{ "gentoo/gentoo-syntax", event = "VeryLazy" },
		--tmux windows switching
		{ "christoomey/vim-tmux-navigator" },
		--unto tree
		{ "mbbill/undotree" },
		--preview color
		{ "uga-rosa/ccc.nvim", lazy = true },
		--vim fugitive
		{ "tpope/vim-fugitive", lazy = true },
		--epic game
		{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
		-- epic game 2
		{ "seandewar/nvimesweeper", event = "VeryLazy" },
	},
	-- md preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		event = "VeryLazy",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- formatting stuff
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	-- linting
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
	},
	-- terminal
	{
		{ "akinsho/toggleterm.nvim", version = "*", config = true },
	},
})
