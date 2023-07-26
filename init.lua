require("remaps")
require("packagemanager")
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

})
vim.cmd[[colorscheme tokyonight-night]]