return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-mini/mini.nvim",
        },
        config = function()
            require("config.plugin.render-markdown")
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function()
                    vim.opt_local.spell = true
                    vim.opt_local.spelllang = "en_us"
                end,
            })

        end,
    },
    {
        "dhruvasagar/vim-table-mode",
        ft = "markdown",
        config = function()
            vim.g.table_mode_corner = "|"
            vim.api.nvim_set_keymap("n", "<leader>tm", ":TableModeToggle<CR>", { noremap = true, silent = true })
        end,
    },
}
