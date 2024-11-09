local options = {
  defaults = {
    mappings = {
      i = {
        -- ["<Tab>"] = require("telescope.actions").move_selection_next,
        -- ["<S-Tab>"] = require("telescope.actions").move_selection_previous,
        -- ["<C-j>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
        -- ["<C-k>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_better,
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<Esc>"] = require("telescope.actions").close,
      },
    },
    file_ignore_patterns = {
      "%.pb%.go$",
      "%.pb%.validate%.go$",
    },
  },
}

return options
