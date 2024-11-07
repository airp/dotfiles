vim.api.nvim_command "hi FlashMatch guifg=#b4befe guibg=#1e1e2e"
vim.api.nvim_command "hi FlashCurrent guifg=#fab387 guibg=#1e1e2e"
vim.api.nvim_command "hi FlashLabel cterm=bold gui=bold guifg=#a6e3a1 guibg=#1e1e2e"
vim.api.nvim_command "hi FlashBackdrop guifg=#6c7086"

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { ",", mode = { "n", "x", "o" }, function() require("flash").jump({ continue = true }) end, desc = "Continue Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
