return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "stevearc/conform.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "⚑",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
        virtual_lines = {
          current_line = true,
        }
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = event.buf }
            vim.keymap.set(mode, lhs, rhs, opts)
          end

          bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
          bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
          bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
          bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
          bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
          bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
          bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
          bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
        end
      })

      lspconfig.bashls.setup({})
      -- lspconfig.denols.setup({})
      lspconfig.elixirls.setup({
        cmd = { vim.uv.os_homedir() .. "/.elixir-ls/release/language_server.sh" },
        -- default settings
        settings = {
          dialyzerEnabled = true,
          fetchDeps = false,
          enableTestLenses = false,
          suggestSpecs = false,
        },
      })
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            }
          }
        }
      })
      lspconfig.marksman.setup({})
      lspconfig.prolog_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.ts_ls.setup({})

      -- maybe move this to a separate file
      require("conform").setup({
        formatters_by_ft = {
          python = { "black" },
        },
        format_on_save = {
          lsp_format = "fallback",
          timeout_ms = 500,
        }
      })
    end
  }
}
