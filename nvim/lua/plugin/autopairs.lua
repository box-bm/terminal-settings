local npairs = require("nvim-autopairs")

npairs.setup({
	check_ts = true,
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- config for surround
require("nvim-surround").setup({
	keymaps = {
		normal = "ys", -- add surround
		normal_cur = "yss", -- add surround to current line
		delete = "ds", -- delete surround
		change = "cs", -- change surround
		visual = "S", -- surround selection
	},
})
