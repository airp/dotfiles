local M = {}

M.grep_selected_text = function(opts)
  local text = nil
  local mode = vim.fn.mode()

  if mode == "v" or mode == "V" then
    vim.cmd 'normal! "vy'
    text = vim.fn.getreg("v"):gsub("\n", "")
  end

  local args = opts or {}
  if text and text ~= "" then
    args = vim.tbl_extend("force", args, {
      default_text = text,
    })
  end

  require("telescope.builtin").live_grep(args)
end

return M
