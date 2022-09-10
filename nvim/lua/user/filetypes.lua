vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local group = vim.api.nvim_create_augroup("Filetypes", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = group,
  pattern = "*.pl",
  command = "set filetype=prolog"
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = {"*.py", "*.sh", "*.bash", "*.zsh", "*.erl", "*.pl"},
  command = "setlocal shiftwidth=4 softtabstop=4"
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "*.go",
  command = "setlocal softtabstop=4 shiftwidth=4 noexpandtab"
})
