local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    -- go = { "goimports", "gofumpt", "golines" },
    go = { "goimports", "gofmt" },
    python = { "black", "isort" },
    --python = { "mypy", "ruff" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
