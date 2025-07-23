vim.api.nvim_del_keymap("n", "cr")
vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  "<Plug>(abolish-coerce-word)",
  { desc = "abolish", noremap = true, silent = true }
)
