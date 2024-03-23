vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.loader.enable()

require("configs.keymaps")
require("configs.lazy")
require("configs.options")
require("plugins.debugging")
require("plugins.formatting")
require("plugins.gitsigns")
require("plugins.harpoon")
require("plugins.linting")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.mason")
require("plugins.nvim-cmp")
require("plugins.nvim-tree")
require("plugins.parsers")
require("plugins.snippets")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.ui")
require("plugins.undotree")
