require("toggleterm")

local map = vim.keymap.set

-- Toggle terminal
map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { silent = true, desc = "Toggle terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { silent = true, desc = "Toggle floating terminal" })
map(
	"n",
	"<leader>th",
	"<cmd>ToggleTerm direction=horizontal<CR>",
	{ silent = true, desc = "Toggle horizontal terminal" }
)
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { silent = true, desc = "Toggle vertical terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { silent = true, desc = "Return to normal mode in terminal" })
map("n", "<leader>tn", "<cmd>ToggleTerm direction=tab<CR>", { silent = true, desc = "Open new terminal in tab" })
