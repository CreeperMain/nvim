local lint = require("lint")
lint.linters_by_ft = {
	cpp = { "cpplint" },
	c = { "cpplint" },
	javascript = { "oxlint" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	svelte = { "eslint_d" },
	--html = { "eslint_d" },
	python = { "pylint" },
	css = { "stylelint" },
	lua = { "selene" },
	bash = { "shellcheck" },
}
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

-- :h events to check for more event you can add
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})
vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "triggers linting for the current file" })
