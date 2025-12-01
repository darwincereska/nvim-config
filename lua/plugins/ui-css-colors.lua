return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" }, -- load on file open
  config = function()
    require("colorizer").setup(
      { "*" }, -- highlight colors in all files
      {
        RGB      = true,      -- #RGB
        RRGGBB   = true,      -- #RRGGBB
        names    = true,      -- CSS color names
        RRGGBBAA = true,      -- #RRGGBBAA
        rgb_fn   = true,      -- css rgb() functions
        hsl_fn   = true,      -- css hsl() functions
        css      = true,      -- enable all css features
        css_fn   = true,      -- enable all css functions
      }
    )
  end,
}

