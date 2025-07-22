require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

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

usercmd("CloseUnmodifiedGitBuffers", function()
  local gitsigns = require "gitsigns"
  local buffers = vim.api.nvim_list_bufs()
  local modified_buf = nil
  local to_delete = {}

  local exclude_patterns = {
    "%.pb%.go$",
    "%.pb%.validate%.go$",
  }

  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].modifiable and vim.fn.bufname(buf) ~= "" then
      local buf_name = vim.fn.bufname(buf)
      local is_excluded = false
      for _, pattern in ipairs(exclude_patterns) do
        if buf_name:match(pattern) then
          is_excluded = true
          break
        end
      end

      if is_excluded then
        table.insert(to_delete, buf)
      else
        local ok, hunks = pcall(gitsigns.get_hunks, buf)
        if ok and vim.tbl_isempty(hunks or {}) then
          table.insert(to_delete, buf)
        else
          if buf == vim.api.nvim_get_current_buf() or modified_buf == nil then
            modified_buf = buf
          end
        end
      end
    end
  end

  if modified_buf and modified_buf ~= vim.api.nvim_get_current_buf() then
    vim.api.nvim_set_current_buf(modified_buf)
  end

  for _, buf in ipairs(to_delete) do
    -- print("Delete Buffer ID: " .. buf .. " Buffer Name: " .. vim.fn.bufname(buf))
    vim.api.nvim_buf_delete(buf, { force = true })
  end
end, {})
