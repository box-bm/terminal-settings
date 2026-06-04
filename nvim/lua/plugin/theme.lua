-- ============================================================================
-- Theme Configuration (Catppuccin Mocha)
-- ============================================================================

vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd.colorscheme("catppuccin-mocha")

local mocha = require("catppuccin.palettes").get_palette("mocha")

vim.api.nvim_set_hl(0, "CursorLine", { bg = mocha.surface0 })
vim.api.nvim_set_hl(0, "Visual", { bg = mocha.surface1 })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { fg = mocha.overlay0 })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = mocha.yellow, bold = true })

-- Terminal colors (Catppuccin Mocha palette)
vim.g.terminal_color_0  = mocha.surface1
vim.g.terminal_color_1  = mocha.red
vim.g.terminal_color_2  = mocha.green
vim.g.terminal_color_3  = mocha.yellow
vim.g.terminal_color_4  = mocha.blue
vim.g.terminal_color_5  = mocha.mauve
vim.g.terminal_color_6  = mocha.teal
vim.g.terminal_color_7  = mocha.subtext1
vim.g.terminal_color_8  = mocha.surface2
vim.g.terminal_color_9  = mocha.maroon
vim.g.terminal_color_10 = mocha.green
vim.g.terminal_color_11 = mocha.peach
vim.g.terminal_color_12 = mocha.sapphire
vim.g.terminal_color_13 = mocha.pink
vim.g.terminal_color_14 = mocha.sky
vim.g.terminal_color_15 = mocha.text
