return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-mini/mini.nvim",
        },
        config = function()
            require("render-markdown").setup({
                completions = { lsp = { enabled = true } },

                heading = {
                    enabled = true,
                    sign = false,
                    icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
                    signs = { "▶"},
                    left_pad = 0,
                    right_pad = 0,
                    width = "full",
                    min_width = 0,
                    border = true,
                    border_virtual = true,
                    above = "▄",
                    below = "▀",
                },

                code = {
                    enabled = true,
                    sign = true,
                    style = "full",
                    position = "left",
                    language_pad = 2,
                    disable_background = { "diff" },
                    width = "full",
                    left_pad = 0,
                    right_pad = 0,
                    min_width = 0,
                    border = "thin",
                    above = "▄",
                    below = "▀",
                    highlight = "RenderMarkdownCode",
                    highlight_inline = "RenderMarkdownCodeInline",
                },

                win_options = {
                    conceallevel = {
                        default = vim.o.conceallevel,
                        rendered = 3,
                    },
                    concealcursor = {
                        default = vim.o.concealcursor,
                        rendered = "n",
                    },
                },
            })

            -- Fix tab behavior in markdown files
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function()
                    vim.opt_local.spell = true
                    vim.opt_local.spelllang = "en_us"

                    -- Override tab mapping in markdown files
                    vim.keymap.set("i", "<Tab>", function()
                        -- Check if we're in a code block
                        local line = vim.api.nvim_get_current_line()
                        local col = vim.api.nvim_win_get_cursor(0)[2]

                        -- If we're at the beginning of a line or after whitespace, insert tab
                        if col == 0 or line:sub(1, col):match("^%s*$") then
                            return "<Tab>"
                        else
                            -- Otherwise, let completion handle it if available
                            if vim.fn.pumvisible() == 1 then
                                return "<C-n>"
                            else
                                return "<Tab>"
                            end
                        end
                    end, { expr = true, buffer = true })
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
