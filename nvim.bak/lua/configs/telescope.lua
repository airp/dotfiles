local actions = require "telescope.actions"
local select_one_or_multi = function(prompt_bufnr)
  local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    actions.close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format("%s %s", "edit", j.path))
      end
    end
  else
    actions.select_default(prompt_bufnr)
  end
end

return {
  defaults = {
    mappings = {
      i = {
        -- 在insert模式下使用 <C-/> 查看有哪些actions
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        -- ["<A-q>"] = "<ESC>",
        ["<C-c>"] = "close",
        ["<cr>"] = select_one_or_multi,
      },
      n = {
        ["<C-c>"] = "close",
        ["<cr>"] = select_one_or_multi,
      },
    },
  },
}
