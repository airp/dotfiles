return {
  "uga-rosa/translate.nvim",
  keys = {
    { "<leader>tw", "viw:Translate ZH<cr>", mode = "n", desc = "翻译光标" },
    { "<leader>tw", ":Translate ZH<cr>", mode = "v", desc = "翻译选中" },
  },
  config = function()
    require("translate").setup {
      default = {
        command = "translate_shell",
      },
      preset = {
        output = {
          split = {
            append = true,
          },
        },
      },
    }
  end,
}
