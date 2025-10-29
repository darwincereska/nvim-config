return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    lazy = false,
    config = function()
        require("config.plugin.ufo")
    end
}
