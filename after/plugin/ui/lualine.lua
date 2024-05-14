--REWRITE ALL THIS
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "tokyonight",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				separator = { right = "" },
				icon = "",
			},
		},
		lualine_b = {
			{
				"filetype",
				icon = { align = "left" }, -- Display filetype icon on the right hand side
				icon_only = true,
				separator = { right = "" },
				color = { bg = "#24283b" },
			},
			{
				"filename",
				file_status = false,
				padding = { right = 1 },
				separator = { right = "" },
				color = { fg = "#a9b1d6", bg = "#24283b" },
			},
			{
				"filesize",
				separator = { right = "" },
			},
		},
		lualine_c = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic", "nvim_lsp", "nvim_workspace_diagnostic" },
				--[[
				diagnostics_color = {
					error = "#f7768e",
					warn = "#e0af68",
					info = "#2ac3de",
					hint = "#35A77C",
				},
                ]]
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				update_in_insert = true,
				always_visible = false,
				separator = { left = "" },
			},
		},
		lualine_x = {
			--[[
			"encoding",
			{
				"fileformat",
				unix = "",
				dos = "󰨡",
				mac = "󰀶",
			},
            ]]
			{
				"diff",
				colored = true,
				symbols = { added = "+", modified = "~", removed = "-" },
				separator = { right = "", left = "" },
				--[[
				diff_color = {
					added = "#34A77C",
					modified = "#7dcfff",
					removed = "#f7768e",
				},
                ]]
			},
			{ "branch", icon = "", separator = { right = "", left = "" } },
		},
		lualine_y = { { "progress", icon = "󰯁", separator = { left = "" }, padding = { right = 0, left = 0 } } },
		lualine_z = {
			--[[
            "location" 
            ]]
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
