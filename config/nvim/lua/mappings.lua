require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del
local wk = require "which-key"

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Disable mappings
nomap("n", "<C-n>") -- nvimtree toggle window
nomap("n", "<leader>b") -- buffer new
nomap("n", "<leader>ds") -- LSP diagnostic loclist
nomap("n", "<leader>ma") -- telescope find marks
nomap("n", "<leader>cm") -- telescope git commits
-- Unmapped key
nomap("n", "<leader>wk")
nomap("n", "<leader>wK")

-- vim-wordmotion
map({ "n", "x", "o" }, "W", "<Plug>WordMotion_w", { desc = "Next word" })
map({ "n", "x", "o" }, "B", "<Plug>WordMotion_b", { desc = "Prev word" })
map({ "n", "x", "o" }, "E", "<Plug>WordMotion_e", { desc = "Next end of word" })
map({ "n", "x", "o" }, "gE", "<Plug>WordMotion_ge", { desc = "Prev end of word" })
map({ "x", "o" }, "aW", "<Plug>WordMotion_aw", { desc = "word with ws" })
map({ "x", "o" }, "iW", "<Plug>WordMotion_iw", { desc = "inner word" })

-- vim-tmux-navigator
map({ "n" }, "<C-h>", ":<C-U>TmuxNavigateLeft<CR>", { silent = true, desc = "" })
map({ "n" }, "<C-j>", ":<C-U>TmuxNavigateDown<CR>", { silent = true, desc = "" })
map({ "n" }, "<C-k>", ":<C-U>TmuxNavigateUp<CR>", { silent = true, desc = "" })
map({ "n" }, "<C-l>", ":<C-U>TmuxNavigateRight<CR>", { silent = true, desc = "" })
map({ "n" }, "<C-\\>", ":<C-U>TmuxNavigatePrevious<CR>", { silent = true, desc = "" })

map({ "n", "v" }, "J", "5j", { desc = "Move down 5 lines" })
map({ "n", "v" }, "K", "5k", { desc = "Move up 5 lines" })

map({ "n" }, "grr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP References via Telescope" })

-- which-key
local icons = {
  window = "",
  buffer = "󱔗",
  git = "",
  close = "󰅙",
  print = "",
  save = "󰆔",
  quit = "󰱝",
  terminal = "",
  lsp = "󰿘",
  diagnostic = "󰇒",
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
  { "<leader>r", hidden = true },

  -- { "<leader>w", group = "Windows", icon = icons.window, proxy = "<c-w>" }, -- proxy to window mappings

  { "<leader>g", group = "Git", icon = icons.git },
  { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "telescope git commits" },

  { "<leader>f", group = "Find" },
  { "<leader>fm", "<cmd>Telescope marks<CR>", desc = "telescope find marks" },
  {
    "<leader>fw",
    function()
      local grep_utils = require "utils.telescope_grep"
      grep_utils.grep_selected_text()
    end,
    desc = "telescope live grep",
    mode = { "n", "v" },
  },
  {
    "<leader>fW",
    function()
      local grep_utils = require "utils.telescope_grep"
      grep_utils.grep_selected_text {
        additional_args = function()
          return { "--word-regexp" }
        end,
      }
    end,
    desc = "telescope live grep (whole word)",
    mode = { "n", "v" },
  },

  { "<leader>l", group = "LSP", icon = icons.lsp },
  { "<leader>lr", require "nvchad.lsp.renamer", desc = "LSP NvRenamer" },
  { "<leader>lk", vim.lsp.buf.hover, desc = "LSP Hover" },
  { "<leader>la", vim.lsp.buf.code_action, desc = "LSP Code action", mode = { "n", "v" } },
  { "<leader>lh", vim.lsp.buf.signature_help, desc = "LSP Show signature help" },
  {
    "<leader>ls",
    function()
      require("telescope.builtin").lsp_document_symbols()
    end,
    desc = "LSP Symbols: all kinds",
  },
  {
    "<leader>lf",
    function()
      require("telescope.builtin").lsp_document_symbols {
        symbols = { "function", "method" },
      }
    end,
    desc = "LSP Symbols: functions & methods",
  },

  { "<leader>d", group = "Diagnostic", icon = icons.diagnostic },
  {
    "<leader>ds",
    function()
      require("telescope.builtin").diagnostics {
        bufnr = 0, -- 当前 buffer
      }
    end,
    desc = "LSP diagnostic loclist",
  },

  -- stylua: ignore start
  { "<leader>c", group = "Close", icon = icons.close },
  { "<leader>cu", "<cmd>CloseUnmodifiedGitBuffers<CR>", desc = "Close Unmodified Git Buffers" },

  { "<leader>t", group = "Toggle" },

  { "<leader>b", group = "Buffers", icon = icons.buffer },
  { "<leader>bb", "<Cmd>enew<CR>", desc = "buffer new" },
  { "<leader>bc", desc = "buffers", expand = function() return require("which-key.extras").expand.buf() end, },

  { "<leader>p", group = "Print", icon = icons.print },
  { "<leader>pt", function() print "hello world" end, desc = "Foobar", },
  -- stylua: ignore end

  {
    mode = { "n" },
    { "<leader>e", "<Cmd>NvimTreeToggle<CR>", desc = "nvimtree toggle window", hidden = true },
    { "<leader>w", "<Cmd>w<CR>", desc = "Save File", hidden = true },
    { "<leader>q", "<Cmd>confirm q<CR>", desc = "Quit Window", icon = icons.quit },
    { "<leader>Q", "<Cmd>confirm qall<CR>", desc = "Exit NvChad" },
    { "<A-|>", "<Cmd>vsplit<CR>", desc = "Vertical Split" },
    { "<A-\\>", "<Cmd>split<CR>", desc = "Horizontal Split" },
  },
  {
    mode = { "n", "v" },
    { "<leader>j", "J", desc = "Join lines" },
  },
}
