local options = {
	autoindent = true,
	smartindent = true,

	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	--showtabline = 2,

	number = true,
	relativenumber = true,

	incsearch = true,
	hlsearch = false,

	wrap = false,

	swapfile = false,
	backup = false,
	undodir = os.getenv("HOME") .. "/.cache/nvim/undodir",
	undofile = true,

	termguicolors = true,

	scrolloff = 8,
	conceallevel = 0,

	updatetime = 50,

	--	colorcolumn = "80",
	showmode = false,
}
-- :options command for a list of names and descriptions for all vim options
for option, value in pairs(options) do
	vim.opt[option] = value
end
