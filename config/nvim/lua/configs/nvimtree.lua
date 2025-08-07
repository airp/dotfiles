return function()
  local opts = require "nvchad.configs.nvimtree"

  local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.del("n", "s", { buffer = bufnr })
    vim.keymap.set("n", "t", api.node.run.system, { desc = "Run System", buffer = bufnr })
    -- vim.keymap.del("n", "H", { buffer = bufnr })
    -- vim.keymap.del("n", "L", { buffer = bufnr })
    vim.keymap.set("n", "h", api.tree.toggle_hidden_filter, { desc = "Toggle Filter: Dotfiles", buffer = bufnr })
    vim.keymap.set("n", "l", api.node.open.toggle_group_empty, { desc = "Toggle Group Empty", buffer = bufnr })
    vim.keymap.del("n", "K", { buffer = bufnr })
    vim.keymap.del("n", "J", { buffer = bufnr })
    vim.keymap.set("n", "H", api.node.navigate.sibling.first, { desc = "First Sibling", buffer = bufnr })
    vim.keymap.set("n", "L", api.node.navigate.sibling.last, { desc = "Last Sibling", buffer = bufnr })
  end

  opts.on_attach = my_on_attach
  return opts
end
