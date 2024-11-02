local lint = require "lint"
local unpack = unpack or table.unpack

lint.linters_by_ft = {
  lua = { "luacheck" },
  -- python = { "flake8" },
}

-- Disable: accessing undefined variable 'vim'
lint.linters.luacheck.args = {
  unpack(lint.linters.luacheck.args),
  "--globals",
  "vim",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
