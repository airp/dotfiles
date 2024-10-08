-- vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
--   callback = function()
--     for i = 1, 9, 1 do
--       if i <= #vim.t.bufs then
--         vim.keymap.set("n", string.format("<A-%s>", i), function() vim.api.nvim_set_current_buf(vim.t.bufs[i]) end)
--       else
--         vim.keymap.set("n", string.format("<A-%s>", i), function() end)
--       end
--     end
--   end,
-- })

local actions = require "telescope.actions"

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-q>"] = actions.close,
          ["<C-x>"] = actions.send_to_qflist + actions.open_qflist,
        },
        n = {
          ["<C-q>"] = actions.close,
          ["<C-x>"] = actions.send_to_qflist + actions.open_qflist,
        },
      },
      file_ignore_patterns = {
        -- "logs/", -- 匹配 logs 目录及其下的所有文件
        -- ".log", -- 匹配所有路径中包含 .log 的文件
        "logs/*", -- 匹配 logs 目录下的所有文件
        "*.log", -- 匹配所有以 .log 结尾的文件
        ".pb.go",
        ".pb.*.go",
      },
    },
  },
}
