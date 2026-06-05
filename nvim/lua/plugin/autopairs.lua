-- ============================================================================
-- Nvim-Autopairs Configuration
-- ============================================================================

local npairs = require("nvim-autopairs")

npairs.setup({
	check_ts = true,
	disable_filetype = { "TelescopePrompt", "vim" },
})

-- cmp integration is handled in plugin/cmp.lua to avoid double-registration
