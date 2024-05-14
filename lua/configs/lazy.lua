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
		event = { "BufReadPre", "BufNewFile" },
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
					"hrsh7th/cmp-cmdline",
					"saadparwaiz1/cmp_luasnip", -- for lua autocomp
					--snippets
					"L3MON4D3/LuaSnip", --snipet engine
					"rafamadriz/friendly-snippets", --useful snippets library
				},
			},
		},
	},
	--inline-edit
	{
		"AndrewRadev/inline_edit.vim",
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
	{ "lewis6991/gitsigns.nvim" },
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
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
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
	-- indentation
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
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
		-- { "tpope/vim-fugitive", lazy = true },
		--epic game
		{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
		-- epic game 2
		{ "seandewar/nvimesweeper", event = "VeryLazy" },
	},
	-- writer related i.e. youtube script writing
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		event = "VeryLazy",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	--write ur scripts in markdown or txt
	{
		"folke/zen-mode.nvim",
		ft = { "markdown", "txt" },
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/twilight.nvim",
		ft = { "markdown", "txt" },
		event = "VeryLazy",
		opts = {},
	},
	{
		"preservim/vim-pencil",
	},
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
	-- ui plugin
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	-- nvim-ufo aka folds
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
	},
	-- noice.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	-- notify
	{ "rcarriga/nvim-notify" },
	-- which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	-- ts autotag
	{
		"windwp/nvim-ts-autotag",
		ft = "html",
	},
	-- rich discord pressence
	{
		"andweeb/presence.nvim",
	},
	-- take screenshots of code
	{ "mistricky/codesnap.nvim", lazy = true, build = "make", cmd = "CodeSnapPreviewOn" },
})
