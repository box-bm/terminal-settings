-- ============================================================================
-- Vim Visual Multi (Multicursor) Configuration
-- ============================================================================

-- Disable default mappings
vim.g.VM_default_mappings = 0

-- Custom keybindings
vim.g.VM_maps = {
	-- Find and select
	["Find Under"] = "<C-n>", -- Find next occurrence of word under cursor
	["Find Subword Under"] = "<C-n>", -- Find next occurrence (subword)

	-- Add cursors vertically
	["Select Cursor Down"] = "<A-j>", -- Add cursor down
	["Select Cursor Up"] = "<A-k>", -- Add cursor up

	-- Selection control
	["Skip Region"] = "n", -- Skip current region and go to next
	["Remove Last Cursor"] = "N", -- Remove last cursor

	-- Select all
	["Select All"] = "<C-a>", -- Select all occurrences

	-- Exit multicursor mode
	["Exit"] = "<leader>mq",
}
