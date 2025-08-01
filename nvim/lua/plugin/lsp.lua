require("mason-lspconfig").setup {
  automatic_enable = true,
  ensure_installed = {
    "ts_ls", -- TypeScript & JavaScript
    "eslint",      -- JavaScript/TypeScript linting
    "jsonls",      -- JSON
    "kotlin_language_server", -- Kotlin
    "yamlls",      -- YAML
    "marksman"
  }
}
