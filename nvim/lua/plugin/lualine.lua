-- ============================================================================
-- Lualine Statusline Configuration
-- ============================================================================

-- Coldcarbon palette (mirrors plugin/theme.lua): true black + blue/teal/cyan/green
local C = {
	black = "#000000",
	surface = "#161616",
	surface2 = "#2e2e2e",
	text = "#f2f4f8",
	grey = "#525252",
	blue = "#33b1ff",
	teal = "#08bdba",
	cyan = "#3ddbd9",
	green = "#42be65",
	red = "#ee5396", -- kept only for REPLACE mode (danger semantics)
}

local coldcarbon_theme = {
	normal = {
		a = { bg = C.blue, fg = C.black, gui = "bold" },
		b = { bg = C.surface, fg = C.blue },
		c = { bg = C.black, fg = C.text },
	},
	insert = {
		a = { bg = C.green, fg = C.black, gui = "bold" },
		b = { bg = C.surface, fg = C.green },
	},
	terminal = {
		a = { bg = C.green, fg = C.black, gui = "bold" },
		b = { bg = C.surface, fg = C.green },
	},
	command = {
		a = { bg = C.teal, fg = C.black, gui = "bold" },
		b = { bg = C.surface, fg = C.teal },
	},
	visual = {
		a = { bg = C.cyan, fg = C.black, gui = "bold" },
		b = { bg = C.surface, fg = C.cyan },
	},
	replace = {
		a = { bg = C.red, fg = C.black, gui = "bold" },
		b = { bg = C.surface, fg = C.red },
	},
	inactive = {
		a = { bg = C.black, fg = C.blue },
		b = { bg = C.black, fg = C.surface2, gui = "bold" },
		c = { bg = C.black, fg = C.grey },
	},
}

require("lualine").setup({
	options = {
		theme = coldcarbon_theme,
		icons_enabled = true,
		always_divide_middle = true,
		globalstatus = true,
		component_separators = { left = "│", right = "│" },
		section_separators = { left = "", right = "" },
	},

	sections = {
		lualine_a = { "mode" },

		lualine_b = {
			"branch",
			{
				"diff",
				symbols = { added = "+", modified = "~", removed = "-" },
			},
		},

		lualine_c = {
			{
				"filename",
				path = 1, -- relative path
				symbols = {
					modified = "●",
					readonly = "",
					unnamed = "[No Name]",
				},
			},
		},

		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn" },
				symbols = { error = "E:", warn = "W:" },
				colored = true,
				update_in_insert = false,
			},
			{
				"filetype",
				icon_only = false,
			},
		},

		lualine_y = {
			{
				"progress",
			},
		},

		lualine_z = {
			"location",
		},
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},

	tabline = {},
})
