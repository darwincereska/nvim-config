return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 300,
        win = {
            border = "rounded",
            padding = { 1, 2 },
        },
        layout = {
            spacing = 3,
        },
        spec = {
            { "<leader>c", group = "code" },
            { "<leader>f", group = "file/find" },
            { "<leader>g", group = "git" },
            { "<leader>r", group = "rename" },
            { "<leader>t", group = "toggle/table" },
            { "g", group = "goto" },
            { "[", group = "prev" },
            { "]", group = "next" },
        },
    },
}
