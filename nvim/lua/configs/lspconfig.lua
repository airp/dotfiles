-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- list of all servers configured.
lspconfig.servers = {
  "lua_ls",
  "html",
  "cssls",
  -- "clangd",
  "gopls",
  "pyright",
}

-- list of servers configured with default config.
local default_servers = {
  "html",
  "cssls",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

lspconfig.lua_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- enable = false, -- Disable all diagnostics from lua_ls
        -- globals = { "vim" },
      },
      -- Disable: Undefined global `vim`.
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

-- lspconfig.clangd.setup {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
--     nvlsp.on_attach(client, bufnr)
--   end,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    -- disable built-in formatter from LSP.
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  rootdir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
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
}

lspconfig.pyright.setup {
  on_attach = function(client, bufnr)
    -- disable built-in formatter from LSP.
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
  on_init = nvlsp.on_init,
  -- https://github.com/microsoft/pyright/discussions/5852#discussioncomment-6874502
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
        },
      },
    },
  },
}

-- vim.diagnostic.config {
--   virtual_text = {
--     prefix = "🐍",
--   },
-- }
