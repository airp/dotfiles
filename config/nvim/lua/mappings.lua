require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del
local wk = require "which-key"

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Disable mappings
nomap("n", "<C-n>")
nomap("n", "<leader>b")
nomap("n", "<leader>h")
nomap("n", "<leader>v")
nomap("n", "<leader>th")
nomap("n", "<leader>n")
nomap("n", "<leader>rn")
nomap("n", "<leader>ds")
nomap("n", "<leader>ma")
nomap("n", "<leader>cm")

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

-- which-key
local icons = {
  window = "",
  buffer = "󱔗",
  git = "",
  print = "",
  quit = "󰱝",
  terminal = "",
  lsp = "󰿘",
  -- find = "",
}

wk.add {
  { "<leader>/", hidden = true },
  {
    "<leader>=",
    function()
      require("conform").format { lsp_fallback = true }
    end,
    desc = "general format file",
    hidden = true,
  },
  { "<leader>x", hidden = true },

  -- { "<leader>w", group = "Windows", icon = icons.window, proxy = "<c-w>" }, -- proxy to window mappings
  { "<leader>w", group = "Windows", icon = icons.window },

  { "<leader>g", group = "Git", icon = icons.git },
  { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "telescope git commits" },

  { "<leader>f", group = "Find" },
  { "<leader>fm", "<cmd>Telescope marks<CR>", desc = "telescope find marks" },

  { "<leader>l", group = "LSP", icon = icons.lsp },
  { "<leader>ls", vim.diagnostic.setloclist, desc = "LSP diagnostic loclist" },
  { "<leader>lr", require "nvchad.lsp.renamer", desc = "LSP NvRenamer" },
  { "<leader>la", vim.lsp.buf.code_action, desc = "LSP Code action", mode = { "n", "v" } },
  { "<leader>lh", vim.lsp.buf.signature_help, desc = "LSP Show signature help" },

  -- stylua: ignore start
  { "<leader>c", group = "Toggle" },
  { "<leader>ct", function() require("nvchad.themes").open() end, desc = "telescope nvchad themes", },
  { "<leader>cn", "<cmd>set nu!<CR>", desc = "toggle line number" },
  { "<leader>cr", "<cmd>set rnu!<CR>", desc = "toggle relative number" },

  { "<leader>t", group = "Terminal", icon = icons.terminal },
  { "<leader>th", function() require("nvchad.term").new { pos = "sp" } end, desc = "terminal new horizontal term", },
  { "<leader>tv", function() require("nvchad.term").new { pos = "vsp" } end, desc = "terminal new vertical term", },
  { "<leader>tt", "<cmd>Telescope terms<CR>", desc = "telescope pick hidden term" },

  { "<leader>b", group = "Buffers", icon = icons.buffer },
  { "<leader>bb", desc = "buffers", expand = function() return require("which-key.extras").expand.buf() end, },

  { "<leader>p", group = "Print", icon = icons.print },
  { "<leader>pt", function() print "hello world" end, desc = "Foobar", },
  -- stylua: ignore end

  {
    mode = { "n" },
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "nvimtree toggle window", hidden = true },
    { "<leader>q", "<Cmd>confirm q<CR>", desc = "Quit Window", icon = icons.quit },
    { "<leader>Q", "<Cmd>confirm qall<CR>", desc = "Exit NvChad" },
    { "|", "<Cmd>vsplit<CR>", desc = "Vertical Split" },
    { "\\", "<Cmd>split<CR>", desc = "Horizontal Split" },
  },
}
