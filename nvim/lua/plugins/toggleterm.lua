return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup {
      size = 20,
      direction = "float",
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

    local map = vim.keymap.set

    map("n", "<Leader>tf", "<Cmd>ToggleTerm direction=float<CR>")
    map("n", "<Leader>th", "<Cmd>ToggleTerm direction=horizontal size=20<CR>")
    map("n", "<Leader>tv", "<Cmd>ToggleTerm direction=vertical size=80<CR>")
  end
}
