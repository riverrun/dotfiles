local map = vim.keymap.set

map("n", "<F5>", function()
  vim.o.background = (vim.o.background == "dark") and "light" or "dark"
end)

-- remove Ctrl-z and s bindings, so that I don't hit them by mistake
map("", "<C-z>", "<Nop>", { silent = true })
map("", "s", "<Nop>", { silent = true })

-- save all files using `S`
map("n", "S", "<Cmd>wa<CR>", { silent = true })

-- make some commonly used key bindings easier to reach
map({ "i", "v" }, "<C-l>", "<Esc>")

-- remap Y to be more like C and D
map("n", "Y", "y$")

-- navigating buffers
map("n", "<C-p>", "<Cmd>bprevious<CR>")
map("n", "<C-n>", "<Cmd>bnext<CR>")
map("n", "[b", "<Cmd>bprevious<CR>")
map("n", "]b", "<Cmd>bnext<CR>")
map("n", "<Leader>e", ":edit<Space>")
map("n", "<Leader>b", "<Cmd>buffers<CR>:buffer<Space>")
map("n", "<Leader><Leader>", "<C-^>")

-- navigating split screens
map("n", "<C-j>", "<C-w>w")
map("n", "<C-k>", "<C-w>W")

-- search and center
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- cancel search highlighting
map("n", "<C-l>", ":<C-u>nohlsearch<CR><C-l>", { silent = true })

-- quickfix lists
map("n", "[q", "<Cmd>cprev<CR>")
map("n", "]q", "<Cmd>cnext<CR>")
map("n", "<Leader>co", "<Cmd>copen 20<CR>")
map("n", "<Leader>cc", "<Cmd>cclose<CR>")

-- open notes index file
map("n", "<Leader>nn", "<Cmd>e $HOME/Documents/notes/index.md<CR>")

-- execute lua code
map("n", "<Leader>xl", "<Cmd>.lua<CR>")
map("v", "<Leader>xl", ":.lua<CR>")

local function toggle_spell_check()
  vim.opt.spell = not (vim.opt.spell:get())
end

vim.keymap.set("n", "<Leader>s", toggle_spell_check)

-- test helper to run tests for filename and (optionally) line number
-- work out a better way of running tests
local function run_tests(opts)
  local filename = vim.fn.expand("%")
  opts = opts or { linenr = true }
  local suffix = (opts.linenr == true) and ":" .. vim.fn.line(".") or ""
  local file_and_line_nr = filename .. suffix
  require("utils.async_make").make("mix test" .. " " .. file_and_line_nr)
end

map("n", "<Leader>ll", run_tests)
map("n", "<Leader>lf", function() run_tests({ linenr = false }) end)
