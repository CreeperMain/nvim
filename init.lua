vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.loader.enable()

require("configs.keymaps")
require("configs.lazy")
require("configs.options")
