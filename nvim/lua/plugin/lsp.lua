-- ============================================================================
-- LSP (Language Server Protocol) Configuration
-- ============================================================================

-- Mason
require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"jsonls",
		"kotlin_language_server",
		"yamlls",
		"marksman",
		"html",
		"cssls",
		"ruby_lsp",
		"pyright",
		"lua_ls",
		"rust_analyzer",
		"sqlls",
	},
})

-- Enable LSP servers (new API)
local servers = {
	"ts_ls",
	"jsonls",
	"kotlin_language_server",
	"yamlls",
	"marksman",
	"html",
	"cssls",
	"ruby_lsp",
	"pyright",
	"lua_ls",
	"rust_analyzer",
	"sqlls",
}

for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end

-- Dart LSP (manual config)
vim.lsp.config.dartls = {
	cmd = { "dart", "language-server", "--protocol=lsp" },
	filetypes = { "dart" },
	root_markers = { "pubspec.yaml" },
}
vim.lsp.enable("dartls")

-- Diagnostics
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 4,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- Show diagnostics on hover (with delay)
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			scope = "cursor",
			border = "rounded",
			source = "always",
			prefix = " ",
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})

-- ============================================================================
-- LSP Keybindings
-- ============================================================================

local map = vim.keymap.set

-- Navigation
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })

-- Documentation
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<leader>k", vim.lsp.buf.signature_help, { desc = "Signature Help" })

-- Code Actions & Refactoring
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })

-- Formatting
map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format Buffer" })
