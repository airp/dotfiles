-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  -- hl_override = {
  --   Comment = { italic = true },
  --   ["@comment"] = { italic = true },
  -- },

  hl_add = {
    FlashMatch = { fg = "#b4befe", bg = "#1e1e2e" },
    FlashCurrent = { fg = "#fab387", bg = "#1e1e2e" },
    FlashLabel = { fg = "#a6e3a1", bg = "#1e1e2e", bold = true },
    FlashBackdrop = { fg = "#6c7086" },
    FlashPrompt = { link = "NormalFloat" },
  },
}

M.nvdash = {
  load_on_startup = true,
}

return M
