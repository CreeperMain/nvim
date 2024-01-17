local lspconfig = require("lspconfig")
lspconfig.tailwindcss.setup({
	single_file_support = true,
})
--[[lspconfig.eslint.setup({
	single_file_support = true,
})
]]
-- this is the only way to circumnavigate an issue (the lsps dont load)
-- this is also where you configure lsps indvididually
