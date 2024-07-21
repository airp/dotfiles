return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = require "configs.telescope",
  },

  -- https://github.com/olexsmir/gopher.nvim
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  -- {
  --   "mfussenegger/nvim-dap",
  --   init = function()
  --     require "configs.dap"
  --   end,
  -- },

  -- {
  --   "leoluz/nvim-dap-go",
  --   ft = "go",
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function(_, opts)
  --     require("dap-go").setup(opts)
  --     require "configs.dap-go"
  --   end,
  -- },
}
