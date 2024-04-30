-- DAP UI SETUP

require("dapui").setup()
local dap = require("dap")
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end
-- uncomment these to make dapui autoclose ^^^

-- mason-nvim-dap setup
require("mason-nvim-dap").setup({
	handlers = {}, -- sets up dap in the predefined manner
})
--consider removing this^^^

--keymaps

vim.keymap.set("n", "<Esc>", function()
	dapui.close({})
end)
vim.keymap.set("n", "<C-c>", function()
	dapui.close({})
end)
vim.keymap.set("n", "<leader>dx", ":DapTerminate<CR>", { desc = "Kills the debugger" })
vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>", { desc = "Steps over(neznam tochno)" })
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoints for debuggin'" })
vim.keymap.set("n", "<leader>dr", ":DapContinue<CR>", { desc = "Run debugger" })

-- PYTHON DEBUG SPECIFIC
local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
require("dap-python").setup(path)

-- ADAPTER CONFIGURATION HERE
dap.adapters.codelldb = {
	type = "server",
	host = "127.0.0.1",
	port = "${port}",
	executable = {
		command = "/home/martin/.local/share/nvim/mason/bin/codelldb",
		args = { "--port", "${port}" },
	},
}
dap.adapters["pwa-node"] = {
	type = "server",
	host = "127.0.0.1",
	--port = "${port}",
	port = "8123",
	executable = {
		command = "/home/martin/.local/share/nvim/mason/bin/js-debug-adapter",
		--args = { "${port}" },
	},
}
-- configuring it for file types
dap.configurations.cpp = {
	{
		name = "Debug with codelldb",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = true,
		console = "integratedTerminal",
	},
}
dap.configurations.c = dap.configurations.cpp

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "node",
		},
	}
end
