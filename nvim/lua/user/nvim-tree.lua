vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.del("n", "<C-t>", { buffer = bufnr })
end

require("nvim-tree").setup({
  on_attach = on_attach,
})

vim.keymap.set("n", "<C-t>", ":NvimTreeFindFileToggle<CR>")
