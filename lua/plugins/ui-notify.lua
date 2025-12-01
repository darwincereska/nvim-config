return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        local notify = require("notify")
        notify.setup({
            background_colour = "#000000",
            fps = 60,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = ""
            },
            level = 2,
            minimum_width = 50,
            render = "compact",
            stages = "fade_in_slide_out",
            timeout = 3000,
            top_down = true,
        })
        
        -- Set nvim-notify as the default notification handler
        vim.notify = notify
    end,
}
