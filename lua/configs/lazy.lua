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
            {'jay-babu/mason-nvim-dap.nvim'},
		--autocompletion
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-path'},
		{'hrsh7th/cmp-buffer'},
        --snippets
		{'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
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
-- dap
  {
    'mfussenegger/nvim-dap',
    config = function(_,_)
        require("configs.keymaps")
    end
  },
  { "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = "mfussenegger/nvim-dap",
  config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function()
          dapui.close()
      end
      dap.listeners.after.event_exited["dapui_config"] = function()
          dapui.close()
      end
  end
  },
-- auto closing brackets
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
},
{
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},
-- blankline indentation
{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
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
    --auto close
'windwp/nvim-ts-autotag',
}
		})
