vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd.colorscheme("jellybeans")

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#303030" })

vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#5f5f5f" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffd75f", bold = true })
