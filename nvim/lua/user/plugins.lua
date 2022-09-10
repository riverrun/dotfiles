return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lualine/lualine.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "neovim/nvim-lspconfig"
  use { "hrsh7th/nvim-cmp", requires = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    },
  }
  use { "L3MON4D3/LuaSnip", tag = "v1.*" }
  use "rafamadriz/friendly-snippets"
  use { "nvim-telescope/telescope.nvim", tag = "0.1.0" }
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "lewis6991/gitsigns.nvim"
  use { "akinsho/toggleterm.nvim", tag = "v1.*" }
  use "elixir-editors/vim-elixir"
end)
