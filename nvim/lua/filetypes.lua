vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

local group = vim.api.nvim_create_augroup("Filetypes", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = group,
  pattern = "*.pl",
  command = "set filetype=prolog"
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "python", "sh", "zsh", "erlang", "prolog" },
  command = "setlocal shiftwidth=4 softtabstop=4"
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "c", "go" },
  command = "setlocal softtabstop=8 shiftwidth=8 noexpandtab"
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "markdown", "text" },
  command = "setlocal linebreak"
})
