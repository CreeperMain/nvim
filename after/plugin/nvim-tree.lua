local tree = require("nvim-tree")

tree.setup({
	hijack_cursor = true,
	sync_root_with_cwd = true,
	view = {
		signcolumn = "yes",
		relativenumber = true,
		width = {
			padding = 8,
			min = 200,
			max = 25,
		},
	},
	renderer = {
		highlight_git = true,
		full_name = true,
		group_empty = true,
		special_files = {},
		symlink_destination = false,
		indent_markers = {
			enable = true,
		},
		icons = {
			padding = " ",
			git_placement = "signcolumn",
			diagnostics_placement = "signcolumn",
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "󱧮",
				},
				git = {
					unstaged = " ",
					staged = " ",
					unmerged = " ",
					renamed = " 󰑕",
					untracked = " ",
					deleted = " ",
					ignored = " 󱥸",
				},
			},
			show = {
				file = true,
				folder_arrow = false,
				git = true,
			},
		},
	},
	update_focused_file = {
		enable = true,
		update_root = true,
		ignore_list = { "help" },
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = " ",
			info = " ",
			warning = " ",
			error = " ",
		},
	},
	actions = {
		change_dir = {
			enable = true,
			restrict_above_cwd = false,
		},
		open_file = {
			resize_window = true,
			window_picker = {
				chars = "aoeui",
			},
		},
		remove_file = {
			close_window = false,
		},
	},
	log = {
		enable = false,
		truncate = true,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
})

vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local invalid_win = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
			if bufname:match("NvimTree_") ~= nil then
				table.insert(invalid_win, w)
			end
		end
		if #invalid_win == #wins - 1 then
			-- Should quit, so we close all invalid windows.
			for _, w in ipairs(invalid_win) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end,
})
