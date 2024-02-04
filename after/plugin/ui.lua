-- NOTIFY
vim.notify = require("notify")
-- LSPCONFIG
require("lspconfig.ui.windows").default_options.border = "rounded"
-- CCC.NVIM
local ccc = require("ccc")
ccc.setup({
	highlighter = {
		auto_enable = true,
		lsp = true,
	},
})
-- TOKYONIGHT.NVIM COLORSCHEME
require("tokyonight").setup({
	terminal_colors = true,
	--[[
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
	},
    ]]
})
vim.cmd([[colorscheme tokyonight-night]])
-- NVIM-UFO aka folds
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
vim.keymap.set("n", "zK", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, { desc = "Peek Fold" })

require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "lsp", "indent" }
	end,
})
--INDENT-BLANKLINE
require("ibl").setup({})
-- WRITER MODE
require("zen-mode").setup({
	window = {
		backdrop = 0.95,
		width = 80, -- width of the Zen window
		height = 1, -- height of the Zen window
		options = {
			signcolumn = "no", -- disable signcolumn
			number = false, -- disable number column
			relativenumber = false, -- disable relative numbers
			-- cursorline = false, -- disable cursorline
			-- cursorcolumn = false, -- disable cursor column
			-- foldcolumn = "0", -- disable fold column
			-- list = false, -- disable whitespace characters
		},
	},
	plugins = {
		options = {
			enabled = true,
			ruler = false, -- disables the ruler text in the cmd line area
			showcmd = false, -- disables the command in the last line of the screen
			-- you may turn on/off statusline in zen mode by setting 'laststatus'
			-- statusline will be shown only if 'laststatus' == 3
			laststatus = 0, -- turn off the statusline in zen mode
		},
		twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
		gitsigns = { enabled = false }, -- disables git signs
		tmux = { enabled = true }, -- disables the tmux statusline
		--[[
		alacritty = {
			enabled = true,
			font = "+20", -- (10% increase per step)
		},
        ]]
	},
})
require("twilight").setup({
	context = 1, -- amount of lines we will try to show around the current line
})
-- DASHBOARD
require("dashboard").setup({
	config = {
		center = {
			{
				icon = "",
				icon_hl = "group",
				desc = "description",
				desc_hl = "group",
				key = "shortcut key in dashboard buffer not keymap !!",
				key_hl = "group",
				key_format = " [%s]", -- `%s` will be substituted with value of `key`
				action = "",
			},
		},
		footer = {},
	},
})
-- DRESSING
require("dressing").setup({
	input = {
		enabled = true,
		default_prompt = "Input",
		trim_prompt = true,
		title_pos = "center",
		insert_only = true,
		start_in_insert = true,
		border = "rounded",
		relative = "cursor",
		buf_options = {},
		win_options = {
			wrap = false,
			list = true,
			sidescrolloff = 0,
		},
		override = function(conf)
			return conf
		end,
		get_config = nil,
	},
	select = {
		enabled = true,
		-- Priority list of preferred vim.select implementations
		backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
		trim_prompt = true,
		telescope = nil,
		-- Options for nui Menu
		nui = {
			position = "50%",
			size = nil,
			relative = "editor",
			border = {
				style = "rounded",
			},
			buf_options = {
				swapfile = false,
				filetype = "DressingSelect",
			},
			win_options = {
				winblend = 0,
			},
			max_width = 80,
			max_height = 40,
			min_width = 40,
			min_height = 10,
		},

		builtin = {
			-- Display numbers for options and set up keymaps
			show_numbers = true,
			-- These are passed to nvim_open_win
			border = "rounded",
			-- 'editor' and 'win' will default to being centered
			relative = "editor",

			buf_options = {},
			win_options = {
				cursorline = true,
				cursorlineopt = "both",
			},

			override = function(conf)
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				return conf
			end,
		},
	},
})
