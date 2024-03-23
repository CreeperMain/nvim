-- LSP-ZERO CONFIG
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts, { desc = "hover over an element explaining it" })
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, { desc = "open up floating window of errors on line" })
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, { desc = "go to the next diagnostic" })
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, { desc = "go the last diagnostic" })
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, { desc = "finds references" })
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, { desc = "rename, useful for html tags" })
	vim.keymap.set("n", "fr", require("telescope.builtin").lsp_references, { desc = "find references of functions" }) -- use this to find references of functions
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, { desc = "signature help while in insert" })
end)

--MASON
require("mason").setup({})
-- vaka trebit inache javuvat greshka ^

-- MASON-LSPCONFIG
require("mason-lspconfig").setup({
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})
-- LSPCONFIG
local lspconfig = require("lspconfig")
lspconfig.tailwindcss.setup({
	single_file_support = true,
})
lspconfig.biome.setup({
	single_file_support = true,
})
lspconfig.intelephense.setup({
	single_file_support = true,
})
-- this is the only way to circumnavigate an issue (the lsps dont load)
-- this is also where you configure lsps indvididually
