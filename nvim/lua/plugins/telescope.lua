return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local map = vim.keymap.set
    local builtin = require("telescope.builtin")

    map("n", "<Leader>ff", builtin.find_files, { desc = "Telescope find files" })
    map("n", "<Leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    map("n", "<Leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    map("n", "<Leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
  end
}
