return function()
  local opts = require "nvchad.configs.nvimtree"

  local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.del("n", "<C-k>", { buffer = bufnr })
    vim.keymap.del("n", "s", { buffer = bufnr })
    vim.keymap.set("n", "t", api.node.run.system, {
      desc = "Run System",
      buffer = bufnr,
      noremap = true,
      silent = true,
    })
  end

  opts.on_attach = my_on_attach
  return opts
end
