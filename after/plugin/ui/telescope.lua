require("telescope").load_extension("noice")
require("telescope").setup({
	defaults = {
		layout_config = {
			height = 0.4,
			width = 0.5,
			prompt_position = "top",
			preview_cutoff = 120,
		},
	},
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files with telescope" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Find git files with telescope" })
vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Live grep search by word" }) --very cool searches lines
--vim.keymap.set("n", "<leader>gs", builtin.grep_string, { desc = "Grep strings in a file" })
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
--ps - project search
