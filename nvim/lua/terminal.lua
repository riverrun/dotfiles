local map = vim.keymap.set
local opt = vim.opt_local

local group = vim.api.nvim_create_augroup("Terminal", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  callback = function()
    opt.number = false
    opt.relativenumber = false
    opt.cursorline = false
  end,
})

map("t", "<Esc>", [[<C-\><C-n>]])
map("t", "<C-[>", [[<C-\><C-n>]])
map("t", "<C-l>", [[<C-\><C-n>]])

map("n", "<Leader>tt", function()
  -- vim.cmd.split()
  -- vim.cmd.term()
  for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
    local buffer_name = vim.api.nvim_buf_get_name(buffer)
    if (string.sub(buffer_name, 1, 7) == "term://") then
      vim.api.nvim_win_set_buf(0, buffer)
      return
    end
  end
  vim.cmd.term()
end)

map("n", "<Leader>ts", function()
  -- vim.fn.strftime("%Y%m%d_%H%M%S")
  local timestamp = os.date("%Y%m%d_%H%M%S")
  vim.cmd.write({ "term_" .. timestamp .. ".txt" })
end)
