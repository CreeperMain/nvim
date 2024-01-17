require("mason").setup({
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "󰚌",
		},
	},
})
require("mason-tool-installer").setup({
	-- auto_update = false, turn this on if you ever get tired of hitting u

	-- you can pin a tool to a particular version
	--{ "golangci-lint", version = "v1.47.0" },
	-- you can turn off/on auto_update per tool
	--{ "bash-language-server", auto_update = true },
	ensure_installed = {
		--debuggers
		"js-debug-adapter",
		"codelldb",
		"debugpy",
		"cpptools",
		--linters
		"cpplint",
		"eslint_d",
		"pylint",
		"black",
		"htmlhint",
		"stylelint",
		"selene",
		"biome",
		"oxlint",
		--lsps
		--html
		"html",
		"emmet_language_server",
		"emmet_ls",
		--css
		"cssls",
		"tailwindcss",
		-- javascript
		"tsserver",
		"eslint",
		"vtsls",
		-- lua
		"lua_ls",
		-- cpp
		"clangd",
		-- python
		"pyright",
		--formatters
		"clang-format",
		"stylua",
		"prettier",
		"prettierd",
	},
})
