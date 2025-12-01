return {
    "romgrk/barbar.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        insert_at_start = true,
        animation = false,
        auto_hide = false,
        sidebar_filetypes = {
            NvimTree = true,
            NeoTree = false,
        },
    }
}
