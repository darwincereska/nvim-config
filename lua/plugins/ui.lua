return {
    {
        "nvim-neo-tree/neo-tree.nvim", -- NVim File Tree
        lazy = false,
        priority = 1000,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("config.plugin.neo-tree")
        end,
    },
}
