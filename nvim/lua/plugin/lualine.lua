-- ============================================================================
-- Lualine Statusline Configuration
-- ============================================================================

require("lualine").setup({
	options = {
		theme = "jellybeans",
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
