require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<A-w>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

map({ "n", "t" }, "<A-s>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })

map("n", "<C-h>", "")
map("n", "<C-l>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- 上下滚动浏览
map("n", "<C-j>", "5j")
map("n", "<C-k>", "5k")
map("v", "<C-j>", "5j")
map("v", "<C-k>", "5k")

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "10k")
map("n", "<C-d>", "10j")

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv")
map("v", "K", ":move '<-2<CR>gv-gv")

-- 取消 s 默认功能
map("n", "s", "")
map("n", "ss", "s")
map("n", "sv", ":vsp<CR>")
map("n", "sh", ":sp<CR>")
map("n", "sc", "<C-w>c")
map("n", "so", "<C-w>o")

-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

-- Terminal相关
map("t", "<Esc>", "<C-\\><C-n>")
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]])
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]])
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]])
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]])
