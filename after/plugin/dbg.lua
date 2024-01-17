-- dap ui setup

require("dapui").setup()
local dap = require("dap")
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end
--[[
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end
]]
-- uncomment these to make dapui autoclose ^^^

-- mason-nvim-dap setup
require("mason-nvim-dap").setup({
	handlers = {}, -- sets up dap in the predefined manner
})

--keymaps

vim.keymap.set("n", "<Esc>", function()
	dapui.close({})
end)
vim.keymap.set("n", "<leader>dx", ":DapTerminate<CR>")
vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>")
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>dr", ":DapContinue<CR>")

-- add desc to all of them

-- python dbg specific
local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
require("dap-python").setup(path)

-- dap setup aka configuring indvidual adapters
dap.adapters.lldb = {
	type = "executable",
	-- absolute path is important here, otherwise the argument in the `runInTerminal` request will default to $CWD/lldb-vscode
	--command = "/home/martin/.local/share/nvim/mason/bin/codelldb",
	command = "/usr/bin/lldb-vscode",
	name = "lldb",
}
-- this bit doesnt work ^^^^
dap.adapters.cpp2 = {
	type = "server",
	host = "127.0.0.1",
	port = "${port}",
	executable = {
		command = "/home/martin/.local/share/nvim/mason/bin/codelldb",
		args = { "--port", "${port}" },
	},
}
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "cpp2",
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
