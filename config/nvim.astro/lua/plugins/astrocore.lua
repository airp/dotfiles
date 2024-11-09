-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        clipboard = "unnamedplus",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        wordmotion_nomap = true,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["<tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        -- ["<C-c>"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,

        -- ["<C-f>"] = "<cmd>Telescope live_grep<CR>",
        -- ["<C-p>"] = "<cmd>Telescope find_files<CR>",

        -- vim-wordmotion version
        -- ["W"] = { "w", desc = "Next word" },
        -- ["B"] = { "b", desc = "Prev word" },
        -- ["E"] = { "e", desc = "Next end of word" },
        -- ["gE"] = { "ge", desc = "Prev end of word" },
        ["W"] = { "<Plug>WordMotion_w", desc = "Next word" },
        ["B"] = { "<Plug>WordMotion_b", desc = "Prev word" },
        ["E"] = { "<Plug>WordMotion_e", desc = "Next end of word" },
        ["gE"] = { "<Plug>WordMotion_ge", desc = "Prev end of word" },
      },
      x = {
        -- vim-wordmotion version
        -- ["W"] = { "w", desc = "Next word" },
        -- ["B"] = { "b", desc = "Prev word" },
        -- ["E"] = { "e", desc = "Next end of word" },
        -- ["gE"] = { "ge", desc = "Prev end of word" },
        -- ["iW"] = { "iw", desc = "inner word" },
        -- ["aW"] = { "aw", desc = "word with ws" },
        ["W"] = { "<Plug>WordMotion_w", desc = "Next word" },
        ["B"] = { "<Plug>WordMotion_b", desc = "Prev word" },
        ["E"] = { "<Plug>WordMotion_e", desc = "Next end of word" },
        ["gE"] = { "<Plug>WordMotion_ge", desc = "Prev end of word" },
        ["aW"] = { "<Plug>WordMotion_aw", desc = "word with ws" },
        ["iW"] = { "<Plug>WordMotion_iw", desc = "inner word" },
      },
      o = {
        -- vim-wordmotion version
        -- ["W"] = { "w", desc = "Next word" },
        -- ["B"] = { "b", desc = "Prev word" },
        -- ["E"] = { "e", desc = "Next end of word" },
        -- ["gE"] = { "ge", desc = "Prev end of word" },
        -- ["iW"] = { "iw", desc = "inner word" },
        -- ["aW"] = { "aw", desc = "word with ws" },
        ["W"] = { "<Plug>WordMotion_w", desc = "Next word" },
        ["B"] = { "<Plug>WordMotion_b", desc = "Prev word" },
        ["E"] = { "<Plug>WordMotion_e", desc = "Next end of word" },
        ["gE"] = { "<Plug>WordMotion_ge", desc = "Prev end of word" },
        ["aW"] = { "<Plug>WordMotion_aw", desc = "word with ws" },
        ["iW"] = { "<Plug>WordMotion_iw", desc = "inner word" },
      },
      i = {
        ["<C-b>"] = "<ESC>^i",
        ["<C-e>"] = "<End>",
        ["<C-h>"] = "<Left>",
        ["<C-l>"] = "<Right>",
      },
    },
  },
}