require("tokyonight").setup({
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
	},
})
vim.cmd([[colorscheme tokyonight-night]])
