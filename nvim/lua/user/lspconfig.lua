local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require("cmp_nvim_lsp").default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  -- fix these errors
  -- and maybe create autocmds with `LspAttach` event
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
  end
}

local lspconfig = require("lspconfig")

lspconfig.util.default_config = vim.tbl_deep_extend(
  "force",
  lspconfig.util.default_config,
  lsp_defaults
)

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ""
  })
end

sign({ name = "DiagnosticSignError", text = "✘" })
sign({ name = "DiagnosticSignWarn", text = "▲" })
sign({ name = "DiagnosticSignHint", text = "⚑" })
sign({ name = "DiagnosticSignInfo", text = "" })

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

local group = vim.api.nvim_create_augroup("user_cmds", { clear = true })

vim.api.nvim_create_autocmd("User", {
  pattern = "LspAttached",
  group = group,
  desc = "LSP actions",
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- read about these options
    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
    bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
    bufmap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
    bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
    bufmap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    bufmap("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")
    bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
    bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
    bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
  end
})

lspconfig.elixirls.setup({
  cmd = { vim.loop.os_homedir() .. "/.elixir-ls/release/language_server.sh" },
  -- default settings
  settings = {
    dialyzerEnabled = true,
    fetchDeps = false,
    enableTestLenses = false,
    suggestSpecs = false,
  },
})
lspconfig.gopls.setup({})
lspconfig.pyright.setup({})
lspconfig.sumneko_lua.setup({
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
