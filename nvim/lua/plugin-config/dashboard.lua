local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.setup({
  theme = 'doom',
  config = {
    header = {
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[          ▀████▀▄▄              ▄█ ]],
      [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
      [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
      [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
      [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
      [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
      [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
      [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
      [[   █   █  █      ▄▄           ▄▀   ]],
      [[]],
      [[]],
    },
    center = {
      {
        icon = "  ",
        desc = "Projects                            ",
        action = "Telescope projects",
        key = "f"
      },
      {
        icon = "  ",
        desc = "Recently files                      ",
        action = "Telescope oldfiles",
        key = "a"
      },
      {
        icon = "󰌌  ",
        desc = "Edit keybindings                    ",
        action = "edit ~/.config/nvim/lua/keybindings.lua",
        key = "e"
      },
      {
        icon = "  ",
        desc = "Edit Projects                       ",
        action = "edit ~/.local/share/nvim/project_nvim/project_history",
        key = "h"
      },
    },
    footer = {
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[God gives us evil at the same time, also give us conquer evil weapons.]],
      [[]],
      [[]],
    }
  }
})

-- db.custom_footer = {
--   "",
--   "",
--   "https://github.com/nshen/learn-neovim-lua",
-- }

-- db.custom_center = {
--   {
--     icon = "  ",
--     desc = "Projects                            ",
--     action = "Telescope projects",
--   },
--   {
--     icon = "  ",
--     desc = "Recently files                      ",
--     action = "Telescope oldfiles",
--   },
--   {
--     icon = "  ",
--     desc = "Edit keybindings                    ",
--     action = "edit ~/.config/nvim/lua/keybindings.lua",
--   },
--   {
--     icon = "  ",
--     desc = "Edit Projects                       ",
--     action = "edit ~/.local/share/nvim/project_nvim/project_history",
--   },
-- }

-- db.custom_header = {
--   [[]],
--   [[          ▀████▀▄▄              ▄█ ]],
--   [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
--   [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
--   [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
--   [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
--   [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
--   [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
--   [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
--   [[   █   █  █      ▄▄           ▄▀   ]],
-- }
-- 
-- db.custom_header = {
--   [[]],
--   [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
--   [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
--   [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
--   [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
--   [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
--   [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
--   [[                                                   ]],
--   [[                [ version : 1.0.0 ]                ]],
-- }

