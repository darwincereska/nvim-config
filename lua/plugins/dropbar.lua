return {
    "Bekaboo/dropbar.nvim",
    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },
    config = function()
        local dropbar_api = require("dropbar.api")
    end
}
