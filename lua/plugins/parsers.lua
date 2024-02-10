-- TREESITTER
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "markdown", "lua", "vim", "vimdoc", "javascript", "html", "css", "query" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = false },
	incremental_selectio = {
		enable = true,
		--[[
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			mode_decremental = "<bs>",
		},
        ]]
	},
})
