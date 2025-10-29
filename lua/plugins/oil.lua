return {
   "stevearc/oil.nvim",
    ---@module "oil"
    ---@module oil.setupOpts
    opts = {},
    dependencies = { "nvim-mini/mini.icons" },
    lazy = false,
    config = function()
       require("config.plugin.oil")
    end,
}
