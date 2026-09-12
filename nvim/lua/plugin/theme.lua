-- ============================================================================
-- Theme Configuration (Oxocarbon -> "Coldcarbon": true black, cold-only accents)
--
-- Oxocarbon (IBM Carbon) ships pink/purple for strings, functions, warnings,
-- etc. and a near-black (#161616) background. We keep its blue/teal/cyan/green
-- accents and structural greys, force the background to pure #000000, and
-- remap every pink/purple ("warm") highlight group to a cold one. The only
-- warm colors left are red/amber, and only for Error/Warning semantics.
-- ============================================================================

vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd.colorscheme("oxocarbon")

local black = "#000000"
local blue = "#33b1ff"
local blue_bright = "#78a9ff"
local teal = "#08bdba"
local cyan = "#3ddbd9"
local green = "#42be65"
local white = "#f2f4f8"
local grey = "#525252"
local grey_dim = "#8a8a8a"

local hl = vim.api.nvim_set_hl

-- Force a pure black canvas (oxocarbon's own base00 is #161616)
local inactive_bg = "#121316" -- slightly raised, cold-tinted black
hl(0, "Normal", { fg = white, bg = black })
-- NormalNC = the focused-window signal: unfocused splits get a dimmer
-- background and dimmed text so the active split is obvious at a glance.
hl(0, "NormalNC", { fg = grey_dim, bg = inactive_bg })
hl(0, "SignColumn", { fg = "NONE", bg = black })
hl(0, "EndOfBuffer", { fg = black, bg = black })
hl(0, "LineNr", { fg = grey, bg = black })
hl(0, "CursorLineNr", { fg = blue_bright, bg = "NONE", bold = true })
hl(0, "WinSeparator", { fg = grey, bg = black })
hl(0, "VertSplit", { fg = grey, bg = black })

-- Replace decorative pink/purple with cold blue/teal/cyan/green
hl(0, "String", { fg = cyan })
hl(0, "Character", { fg = cyan })
hl(0, "@constant", { fg = green })
hl(0, "@text.uri", { fg = blue, underline = true })
hl(0, "markdownUrl", { fg = blue, underline = true })
hl(0, "@function", { fg = blue, bold = true })
hl(0, "@function.builtin", { fg = blue })
hl(0, "@number.status", { fg = teal })
hl(0, "Decorator", { fg = teal })
hl(0, "NvimTreeImageFile", { fg = teal })
hl(0, "NvimTreeFolderIcon", { fg = blue })
hl(0, "TelescopePreviewTitle", { fg = black, bg = teal })
hl(0, "StatusInsert", { fg = black, bg = green })
hl(0, "StatusVisual", { fg = black, bg = blue })
hl(0, "HydraRed", { fg = teal })
for _, grp in ipairs({ "CmpItemKindField", "CmpItemKindProperty", "CmpItemKindEvent" }) do
	hl(0, grp, { fg = black, bg = teal })
end
for _, grp in ipairs({ "CmpItemKindVariable", "CmpItemKindFile" }) do
	hl(0, grp, { fg = black, bg = green })
end
for _, grp in ipairs({ "BlinkCmpKindField", "BlinkCmpKindProperty", "BlinkCmpKindEvent" }) do
	hl(0, grp, { fg = black, bg = teal })
end
for _, grp in ipairs({ "BlinkCmpKindVariable", "BlinkCmpKindFile" }) do
	hl(0, grp, { fg = black, bg = green })
end

-- Comments: dim grey, no color noise
hl(0, "Comment", { fg = grey_dim, italic = true })

-- Terminal colors (mirrors the Ghostty "Coldcarbon" palette)
vim.g.terminal_color_0 = black
vim.g.terminal_color_1 = "#ee5396" -- errors only
vim.g.terminal_color_2 = green
vim.g.terminal_color_3 = "#d4a72c" -- warnings only
vim.g.terminal_color_4 = blue
vim.g.terminal_color_5 = teal
vim.g.terminal_color_6 = cyan
vim.g.terminal_color_7 = white
vim.g.terminal_color_8 = grey
vim.g.terminal_color_9 = "#ff6b9d"
vim.g.terminal_color_10 = "#52d878"
vim.g.terminal_color_11 = "#e8c14c"
vim.g.terminal_color_12 = blue_bright
vim.g.terminal_color_13 = "#33d9d4"
vim.g.terminal_color_14 = "#82f0ee"
vim.g.terminal_color_15 = "#ffffff"
