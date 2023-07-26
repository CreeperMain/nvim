require("remaps")
require("packagemanager")

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }
  })
vim.cmd[[colorscheme tokyonight-night]]