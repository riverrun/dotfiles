local lualine = require("lualine")

lualine.setup({
  options = {
    theme = "solarized_dark"
  },
  sections = {
    lualine_b = { "branch" },
    lualine_c = { "diff", "diagnostics", "filename" }
  }
})
