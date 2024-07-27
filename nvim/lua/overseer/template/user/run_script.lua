return {
  name = "script",
  condition = {
    filetype = { "sh", "python" },
  },
  params = {
    args = { optional = false, type = "list", delimiter = " " },
  },
  builder = function(params)
    return {
      name = vim.fn.expand "%:t",
      cmd = vim.bo.filetype == "sh" and "bash" or "python3",
      cwd = vim.fn.expand "%:p:h",
      args = vim.list_extend({ vim.fn.expand "%:p" }, params.args),
      components = {
        "display_duration",
        "on_exit_set_status",
        "on_complete_notify",
      },
    }
  end,
}
