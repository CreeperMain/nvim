--CONFORM.NVIM
local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		-- example: javascript = { { "prettierd", "prettier" } },
		css = { "prettier" },
		cpp = { "clang_format" },
		c = { "clang_format" },
		cs = { "clang_format" },
		html = { "prettier" },
		javascript = { "prettier", "prettierd" },
		markdown = { "prettier", "prettierd" },
		lua = { "stylua" },
		python = { "black" },
		json = { "biome" },
	},
	-- Set up format-on-save
		format_on_save = { async = false, timeout_ms = 500, lsp_fallback = true },
	-- i have no idea what this does but i'll keep it here
	-- Customize formatters
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2" },
		},
	},
})
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "format a file (configure the file extension if it doesnt format)" })
-- mode = "",
-- desc = "Format buffer",
