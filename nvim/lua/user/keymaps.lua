local map = vim.keymap.set

map("n", "<F5>", function()
  vim.o.background = (vim.o.background == "dark") and "light" or "dark"
end)

-- remap space as leader key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- remove Ctrl-z and s bindings, so that I don't hit them by mistake
map("", "<C-z>", "<Nop>", { silent = true })
map("", "s", "<Nop>", { silent = true })

-- save all files using `S`
map("n", "S", ":wa<CR>")

-- make some commonly used key bindings easier to reach
map({ "i", "v" }, "<C-l>", "<Esc>")
map("n", "H", "^")
map("n", "L", "$")
map("n", "M", "%")

-- help in new tab
map("n", "<Leader>th", ":tab help<Space>")

-- remap Y to be more like C and D
map("n", "Y", "y$")

-- easier buffer navigation
map("n", "<C-n>", ":bnext<CR>")
map("n", "<C-p>", ":bprevious<CR>")
map("n", "<Leader>e", ":edit<Space>")
map("n", "<Leader>b", ":buffers<CR>:buffer<Space>")
map("n", "<Leader><Leader>", "<C-^>")

-- split screens
map("n", "<C-j>", "<C-w>w")
map("n", "<C-k>", "<C-w>W")

-- search and center
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- cancel search highlighting
map("n", "<C-l>", ":<C-u>nohlsearch<CR><C-l>", { silent = true })

-- open notes index file
map("n", "<Leader>nn", ":e $HOME/Documents/notes/index.md<CR>")

-- telescope
map("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<Leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>")
