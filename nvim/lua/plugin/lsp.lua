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
		"solargraph",
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
	"solargraph",
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
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.o.updatetime = 250

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			scope = "cursor",
			border = "rounded",
			source = "always",
			prefix = " ",
		})
	end,
})

-- LSP keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
	desc = "Go to definition",
})

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
	desc = "Rename symbol",
})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
	desc = "Code action",
})
