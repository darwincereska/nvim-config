return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
       require("config.plugin.treesitter")
    end,
}
