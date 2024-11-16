require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

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

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
unmap("n", "<C-n>")

map({ "n" }, "|", "<Cmd>vsplit<CR>", { desc = "Vertical Split" })
map({ "n" }, "\\", "<Cmd>split<CR>", { desc = "Horizontal Split" })

map({ "n" }, "<leader>q", "<Cmd>confirm q<CR>", { desc = "Quit Window" })
map({ "n" }, "<leader>Q", "<Cmd>confirm qall<CR>", { desc = "Exit NvChad" })

-- Quit NvChad if only sidebar windows are list
autocmd("BufEnter", {
  callback = function()
    local wins = vim.api.nvim_tabpage_list_wins(0)
    -- Both NvimTree and aerial will auto-quit if there is only a single window left
    -- if #wins <= 1 then return end
    local sidebar_fts = { aerial = true, ["NvimTree"] = true }
    for _, winid in ipairs(wins) do
      if vim.api.nvim_win_is_valid(winid) then
        local bufnr = vim.api.nvim_win_get_buf(winid)
        local filetype = vim.bo[bufnr].filetype
        -- If any visible windows are not sidebars, early return
        if not sidebar_fts[filetype] then
          return
          -- If the visible window is a sidebar
        else
          -- only count filetypes once, so remove a found sidebar from the detection
          sidebar_fts[filetype] = nil
        end
      end
    end
    if #vim.api.nvim_list_tabpages() > 1 then
      vim.cmd.tabclose()
    else
      vim.cmd.qall()
    end
  end,
})

usercmd("ListWins", function()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  for _, winid in ipairs(wins) do
    print("Window ID: " .. winid)
    if vim.api.nvim_win_is_valid(winid) then
      local bufnr = vim.api.nvim_win_get_buf(winid)
      local filetype = vim.bo[bufnr].filetype
      print("Buffer ID: " .. bufnr .. " Filetype: " .. (filetype ~= "" and filetype or "unknown"))
    end
  end
end, {})
