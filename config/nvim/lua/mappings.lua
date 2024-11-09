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

-- vim-tmux-navigator
map({ "n" }, "<c-h>", ":<C-U>TmuxNavigateLeft<cr>", { noremap = true, silent = true, desc = "" })
map({ "n" }, "<c-j>", ":<C-U>TmuxNavigateDown<cr>", { noremap = true, silent = true, desc = "" })
map({ "n" }, "<c-k>", ":<C-U>TmuxNavigateUp<cr>", { noremap = true, silent = true, desc = "" })
map({ "n" }, "<c-l>", ":<C-U>TmuxNavigateRight<cr>", { noremap = true, silent = true, desc = "" })
map({ "n" }, "<c-\\>", ":<C-U>TmuxNavigatePrevious<cr>", { noremap = true, silent = true, desc = "" })

map({ "n" }, "<leader>qq", "<cmd>qa<cr>", { noremap = true, silent = true, desc = "Exit" })
map({ "n" }, "<leader>q!", "<cmd>qa!<cr>", { noremap = true, silent = true, desc = "Exit !" })
