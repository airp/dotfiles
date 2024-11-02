local options = {
  defaults = {
    mappings = {
      i = {
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
