require("neorg").setup({
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.concealer"] = {}, -- Adds pretty icons to your documents
		["core.integrations.treesitter"] = {},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					notes = "~/Notes",
					comp = "~/Notes/computerstuff",
					long = "~/Notes/longterm",
					proektna = "~/Notes/proektna",
					youtube = "~/Notes/youtube-notes",
				},
				default_workspace = "notes",
			},
		},
	},
})
