require("remaps") --key maps 
require("packagemanager") --boostraping lazy
require("set")
require('lazy').setup({
-- color scheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
--fuzzy finder
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
-- tree sitter
    {
      -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      build = ':TSUpdate',
    },
    'nvim-treesitter/playground', --mozhda ne trebit
    'ThePrimeagen/harpoon',
    'mbbill/undotree', --look into this
    'tpope/vim-fugitive',
    'gentoo/gentoo-syntax',
    --lsp stuff
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
          'williamboman/mason.nvim',
          build = function()
            pcall(vim.api.nvim_command, 'MasonUpdate')
          end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional
    
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
      },
    },
    --statusline
    {
      -- Set lualine as statusline
      'nvim-lualine/lualine.nvim',
      -- See `:help lualine.txt`
    },
    'nvim-tree/nvim-tree.lua', --configure this
    'nvim-tree/nvim-web-devicons',
--this is for which key which really helps with the keybindings
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
--this is the dashboard stuff
{
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
},
{
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
})
vim.cmd[[colorscheme tokyonight-night]]
require("treesitter")
--require("dashboard")
-- ^^^^^^ this has to be here, because you cant have it before you call it in requirelazy --
