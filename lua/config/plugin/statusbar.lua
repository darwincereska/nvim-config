require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = { "NvimTree", "neo-tree", "alpha", "dashboard" },
            winbar = { "NvimTree", "neo-tree", "alpha", "dashboard" },
        },
        ignore_focus = { "NvimTree", "neo-tree" },
        always_divide_middle = true,
        globalstatus = true, -- This makes lualine span the entire bottom
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { "mode" }, -- Shows full text like "NORMAL", "INSERT", "VISUAL"
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { 
            "filename",
            {
                function()
                    return vim.b.table_mode_active == 1 and "[TABLE]" or ""
                end,
                color = { fg = "#98c379" }, -- Green color
            },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "nvim-tree", "neo-tree" }
}

