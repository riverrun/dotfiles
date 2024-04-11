return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "honza/vim-snippets",
  },
  config = function()
    local ls = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()
    ls.filetype_extend("all", { "_" })
  end
}
