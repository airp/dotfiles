local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    json = { "prettier" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    -- c = { "clang-format" },
    -- cpp = { "clang-format" },
    go = { "gofmt", "goimports-reviser", "golines" },
    python = { "isort", "black" },
  },

  formatters = {
    -- Lua
    stylua = {
      prepend_args = {
        "--column-width",
        "120",
        "--line-endings",
        "Unix",
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
        "--quote-style",
        "AutoPreferDouble",
      },
    },

    -- -- C & C++
    -- ["clang-format"] = {
    --   prepend_args = {
    --     "-style={ \
    --                 IndentWidth: 4, \
    --                 TabWidth: 4, \
    --                 UseTab: Never, \
    --                 AccessModifierOffset: 0, \
    --                 IndentAccessModifiers: true, \
    --                 PackConstructorInitializers: Never}",
    --   },
    -- },

    -- Golang
    ["goimports-reviser"] = {
      prepend_args = { "-rm-unused" },
    },
    golines = {
      prepend_args = { "--max-len=160" },
    },

    -- Python
    isort = {
      prepend_args = {
        "--profile",
        "black",
      },
    },
    black = {
      prepend_args = {
        "--fast",
        "--line-length",
        "100",
      },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_fallback = true,
  },
}

return options
