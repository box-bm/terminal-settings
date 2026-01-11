vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    width = 50,
    side = "left",
  },
  on_attach = my_on_attach,
  sort = {
    sorter = "case_sensitive",
  },
  git = {
    ignore = false,
  },
  filters = {
    enable = false,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
})

vim.keymap.set("n", "<Leader>et", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })
vim.keymap.set("n", "<Leader>ef", ":NvimTreeFocus<CR>", { noremap = true, silent = true, desc = "Focus NvimTree" })
