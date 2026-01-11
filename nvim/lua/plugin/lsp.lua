require("mason").setup()

require("mason-lspconfig").setup({
  automatic_enable = true,
  ensure_installed = {
    "ts_ls",                  -- TypeScript & JavaScript
    "eslint",                 -- JavaScript/TypeScript linting
    "jsonls",                 -- JSON
    "kotlin_language_server", -- Kotlin
    "yamlls",                 -- YAML
    "marksman",               -- Markdown
    -- html
    "html",
    -- css
    "cssls",
    -- ruby
    "solargraph",
    "ruby_lsp",
    -- python
    "pyright",
    -- lua
    "lua_ls",
    -- rust
    "rust_analyzer",
    -- sql
    "sqlls",
    -- yml
    "yamlls",
  },
})

vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("jsonls")
vim.lsp.enable("kotlin_language_server")
vim.lsp.enable("yamlls")
vim.lsp.enable("marksman")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("solargraph")
vim.lsp.enable("ruby_lsp")
vim.lsp.enable("pyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("sqlls")
vim.lsp.enable("yamlls")

vim.lsp.config.dartls = {
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  root_markers = { "pubspec.yaml" },
}
vim.lsp.enable("dartls")

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

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

vim.o.updatetime = 250
