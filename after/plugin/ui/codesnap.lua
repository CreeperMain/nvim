require("codesnap").setup({
	keys = {
		{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
		{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Screenshots" },
	},
	save_path = "~/Screenshots",
	mac_window_bar = false,
	title = "negro",
	code_font_family = "CaskaydiaCove Nerd Font",
	watermark_font_family = "Sans Serif",
	watermark = "zdravo",
	bg_theme = "sea",
	breadcrumbs_separator = "/",
	has_breadcrumbs = true,
	has_line_number = true,
})
