require("toggleterm").setup {
  size = 15,
  open_mapping = [[<C-\>]]
}

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  local map = vim.keymap.set

  map("t", "<Esc>", [[<C-\><C-n>]], opts)
  map("t", "<C-[>", [[<C-\><C-n>]], opts)
  map("t", "<C-j>", [[<C-\><C-n><C-w>w]], opts)
end

local group = vim.api.nvim_create_augroup("Terminal", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  pattern = "term://*",
  callback = set_terminal_keymaps,
})
