-- moves blocks of text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves selected text blocks down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves selected text blocks up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--vim.keymap.set("n", "n", "nzzv")
--vim.keymap.set("n", "N", "Nzzv")

-- nvim tree commands
vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeToggle, { desc = "Opens up nvim-tree" }) -- n for navigate
-- the "n" bit means while in nomral mode, second bit is if you press leaderpv it will execute the command in the third bit
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exits insert mode" })

-- pasting related
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- exiting veritcal thingy
vim.keymap.set("n", "<C-c>", "<Esc>", { desc = "exits terminal mode" })
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "renames all the words" }
) --look into this very cool and i mean an idividual version
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) --makes a file executable, look at chmod

vim.keymap.set("t", "<C-c>", "<C-\\><C-n><C-w>h", { silent = true })
-- opening up windows
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>", { desc = "Splits the window horizontally" })
vim.keymap.set("n", "<leader>\\", "<cmd>vsplit<CR>", { desc = "Splits the window vertically" })
-- spellcheck
vim.keymap.set("i", "<C-s>", "<Esc>[s1z=`]a", {desc="Spell check & correct"})
-- to enter write mode ZenMode | Pencil & set spell
