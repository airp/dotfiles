local M = {}

M.grep_with_text = function(opts)
  local text = ""
  if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
    vim.cmd 'normal! "vy'
    text = vim.fn.getreg("v"):gsub("\n", "")
  else
    text = vim.fn.expand "<cword>"
  end

  require("telescope.builtin").live_grep(vim.tbl_extend("force", {
    default_text = text,
  }, opts or {}))
end

return M
