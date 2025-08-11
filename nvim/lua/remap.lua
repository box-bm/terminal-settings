vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap

-- Window navigation
-- Move to left window
map("n", "<C-H>", "<C-W>h", { silent = true, desc = "Move to left window" })
-- Move to window below
map("n", "<C-J>", "<C-W>j", { silent = true, desc = "Move to window below" })
-- Move to window above
map("n", "<C-K>", "<C-W>k", { silent = true, desc = "Move to window above" })
-- Move to right window
map("n", "<C-L>", "<C-W>l", { silent = true, desc = "Move to right window" })

-- Buffer management
-- Next buffer
map("n", "<leader>bn", ":bnext<CR>", { silent = true, desc = "Next buffer" })
-- Previous buffer
map("n", "<leader>bp", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })
-- Delete buffer
map("n", "<leader>bd", ":bdelete<CR>", { silent = true, desc = "Delete buffer" })

-- Toggle terminal
map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { silent = true, desc = "Toggle terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { silent = true, desc = "Toggle floating terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { silent = true, desc = "Toggle horizontal terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { silent = true, desc = "Toggle vertical terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { silent = true, desc = "Return to normal mode in terminal" })
map("n", "<leader>tn", "<cmd>ToggleTerm direction=tab<CR>", { silent = true, desc = "Open new terminal in tab" })

-- split buffer
map("n", "<leader>ss", "<C-W>s", { silent = true, desc = "Split buffer horizontally" })
map("n", "<leader>sv", "<C-W>v", { silent = true, desc = "Split buffer vertically" })

-- duplicate selection down
map("n", "<leader>dd", "yyp", { silent = true, desc = "Duplicate selection down" })
map("n", "<leader>du", "yypk", { silent = true, desc = "Duplicate selection up" })

-- in finder or leader ff, open file in new tab
map("n", "<leader>ft", "<cmd>tabnew <C-R>=expand('<cfile>')<CR><CR>", { silent = true, desc = "Open file in new tab" })

-- format code with prettier
map("n", "<leader>pf", "<cmd>Prettier<CR>", { silent = true, desc = "Format code with Prettier" })

-- LSP mappings
-- Go to definition
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true, desc = "Go to definition" })
-- List references
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true, desc = "List references" })
-- Hover documentation
map("n", "K",  "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true, desc = "Hover documentation" })
-- Rename symbol
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true, desc = "Rename symbol" })
-- Code action
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true, desc = "Code action" })
