local M = {}

function M.cfdo_replace_confirm()
  if vim.tbl_isempty(vim.fn.getqflist()) then
    vim.notify("Quickfix list is empty", vim.log.levels.WARN)
    return
  end

  vim.ui.input({ prompt = "Replace (old): " }, function(old)
    if not old or old == "" then
      return
    end

    vim.ui.input({ prompt = "With (new): " }, function(new)
      if new == nil then
        return
      end

      -- 普通文本安全转义
      old = vim.fn.escape(old, "/\\")
      new = vim.fn.escape(new, "/\\")

      vim.cmd "copen"

      vim.cmd(string.format("silent! cfdo %%s/%s/%s/gce | update", old, new))

      vim.notify("cfdo replace finished", vim.log.levels.INFO)
    end)
  end)
end

return M
