local map = vim.keymap.set

-- Window navigation (solo ventanas)
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Visual Multi (vim-visual-multi)
vim.g.VM_default_mappings = 0

vim.g.VM_maps = {
	["Find Under"] = "<C-n>",
	["Find Subword Under"] = "<C-n>",

	["Select Cursor Down"] = "<A-j>",
	["Select Cursor Up"] = "<A-k>",

	["Skip Region"] = "n",
	["Remove Last Cursor"] = "N",

	["Select All"] = "<C-a>",
	["Exit"] = "<leader>mq",
}
