-- ============================================================================
-- Theme Configuration (Jellybeans)
-- ============================================================================

vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd.colorscheme("jellybeans")

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFocused", { bg = "#1a1a1a" })

local focus_group = vim.api.nvim_create_augroup("FocusedWindowBg", { clear = true })
vim.api.nvim_create_autocmd("WinEnter", {
  group = focus_group,
  callback = function()
    vim.wo.winhighlight = "Normal:NormalFocused"
  end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = focus_group,
  callback = function()
    vim.wo.winhighlight = ""
  end,
})
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#303030" })

vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#5f5f5f" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffd75f", bold = true })

-- Terminal colors matching Ghostty's Jellybeans theme
-- Keeps any embedded terminal (e.g. claudecode.nvim) visually consistent
vim.g.terminal_color_0  = "#888888" -- black
vim.g.terminal_color_1  = "#cf6a4c" -- red
vim.g.terminal_color_2  = "#99ad6a" -- green
vim.g.terminal_color_3  = "#d8ad4c" -- yellow
vim.g.terminal_color_4  = "#597bc5" -- blue
vim.g.terminal_color_5  = "#a037b0" -- magenta
vim.g.terminal_color_6  = "#71b9f8" -- cyan
vim.g.terminal_color_7  = "#adadad" -- white
vim.g.terminal_color_8  = "#888888" -- bright black
vim.g.terminal_color_9  = "#cf6a4c" -- bright red
vim.g.terminal_color_10 = "#99ad6a" -- bright green
vim.g.terminal_color_11 = "#ffd75f" -- bright yellow
vim.g.terminal_color_12 = "#597bc5" -- bright blue
vim.g.terminal_color_13 = "#a037b0" -- bright magenta
vim.g.terminal_color_14 = "#71b9f8" -- bright cyan
vim.g.terminal_color_15 = "#e8e8d3" -- bright white
