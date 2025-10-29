return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("config.plugin.comment")
    end,
}
