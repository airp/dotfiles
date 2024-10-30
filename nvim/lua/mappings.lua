require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- vim-wordmotion
map({ "n", "x", "o" }, "W", "<Plug>WordMotion_w", { desc = "Next word" })
map({ "n", "x", "o" }, "B", "<Plug>WordMotion_b", { desc = "Prev word" })
map({ "n", "x", "o" }, "E", "<Plug>WordMotion_e", { desc = "Next end of word" })
map({ "n", "x", "o" }, "gE", "<Plug>WordMotion_ge", { desc = "Prev end of word" })
map({ "x", "o" }, "aW", "<Plug>WordMotion_aw", { desc = "word with ws" })
map({ "x", "o" }, "iW", "<Plug>WordMotion_iw", { desc = "inner word" })
