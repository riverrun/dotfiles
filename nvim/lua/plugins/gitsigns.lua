return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true })

        -- Actions
        map("n", "<Leader>hs", gs.stage_hunk)
        map("n", "<Leader>hr", gs.reset_hunk)
        map("n", "<Leader>hp", gs.preview_hunk)
        map("n", "<Leader>hb", function() gs.blame_line { full = true } end)
        map("n", "<Leader>tb", gs.toggle_current_line_blame)
        map("n", "<Leader>hd", ":Gitsigns diffthis<Space>")

        -- Text object
        map({ "o", "x" }, "ih", ":<C-u>Gitsigns select_hunk<CR>")
      end
    }
  end
}
