-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.recipes.telescope-nvchad-theme" },
  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.proto" },
  -- { import = "astrocommunity.pack.cpp" },
  -- { import = "astrocommunity.pack.vue" },
  -- import/override with your plugins folder
}
