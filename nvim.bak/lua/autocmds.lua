vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
  callback = function()
    for i = 1, 9, 1 do
      if i <= #vim.t.bufs then
        vim.keymap.set("n", string.format("<A-%s>", i), function()
          vim.api.nvim_set_current_buf(vim.t.bufs[i])
        end)
      else
        vim.keymap.set("n", string.format("<A-%s>", i), function() end)
      end
    end
  end,
})

-- vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
--   callback = function()
--     vim.t.bufs = vim.tbl_filter(function(bufnr)
--       return vim.api.nvim_buf_get_option(bufnr, "modified")
--     end, vim.t.bufs)
--   end,
-- })
