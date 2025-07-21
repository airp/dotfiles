local nvlsp = require "nvchad.configs.lspconfig"
nvlsp.defaults()

local function custom_on_attach(client, bufnr)
  -- disable built-in formatter from LSP.
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  nvlsp.on_attach(client, bufnr)

  local nomap = vim.keymap.del
  nomap("n", "<leader>ra", { buffer = bufnr })
  nomap("n", "<leader>wl", { buffer = bufnr })
  nomap("n", "<leader>wr", { buffer = bufnr })
  nomap("n", "<leader>wa", { buffer = bufnr })
end

local servers = {
  lua_ls = {},
  html = {},
  cssls = {},
  jsonls = {},
  intelephense = {},
  gopls = {
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        staticcheck = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  },
  pyright = {
    -- https://github.com/microsoft/pyright/discussions/5852
    -- https://www.reddit.com/r/neovim/comments/11k5but/how_to_disable_pyright_diagnostics/
    capabilities = (function()
      local cap = nvlsp.capabilities
      cap.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
      return cap
    end)(),
    settings = {
      python = {
        analysis = {
          diagnosticSeverityOverrides = {
            -- reportUnusedVariable = false,
            reportIncompatibleVariableOverride = false,
          },
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  local base_opts = {
    on_attach = custom_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }

  local final_opts = vim.tbl_deep_extend("force", base_opts, opts)

  vim.lsp.enable(name)
  vim.lsp.config(name, final_opts)
end

local lspconfig = require "lspconfig"
lspconfig.servers = {}
for name, _ in pairs(servers) do
  table.insert(lspconfig.servers, name)
end

-- vim.diagnostic.config {
--   virtual_text = {
--     prefix = "🐍",
--   },
-- }
