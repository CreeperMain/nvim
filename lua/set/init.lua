vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- configure tmux
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) --look into this very cool and i mean an idividual version
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) --makes a file executable, look at chmod
