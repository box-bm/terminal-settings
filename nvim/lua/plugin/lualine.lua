-- ============================================================================
-- Lualine Statusline Configuration
-- ============================================================================

local C = require("catppuccin.palettes").get_palette("mocha")
local transparent_bg = C.mantle

local catppuccin_theme = {
	normal = {
		a = { bg = C.blue, fg = C.mantle, gui = "bold" },
		b = { bg = C.surface0, fg = C.blue },
		c = { bg = transparent_bg, fg = C.text },
	},
	insert = {
		a = { bg = C.green, fg = C.base, gui = "bold" },
		b = { bg = C.surface0, fg = C.green },
	},
	terminal = {
		a = { bg = C.green, fg = C.base, gui = "bold" },
		b = { bg = C.surface0, fg = C.green },
	},
	command = {
		a = { bg = C.peach, fg = C.base, gui = "bold" },
		b = { bg = C.surface0, fg = C.peach },
	},
	visual = {
		a = { bg = C.mauve, fg = C.base, gui = "bold" },
		b = { bg = C.surface0, fg = C.mauve },
	},
	replace = {
		a = { bg = C.red, fg = C.base, gui = "bold" },
		b = { bg = C.surface0, fg = C.red },
	},
	inactive = {
		a = { bg = transparent_bg, fg = C.blue },
		b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
		c = { bg = transparent_bg, fg = C.overlay0 },
	},
}

require("lualine").setup({
	options = {
		theme = catppuccin_theme,
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
