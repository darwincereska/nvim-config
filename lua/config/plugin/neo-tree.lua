require("neo-tree").setup({
    close_if_last_window = true,
    hijack_netrw_behavior = "disabled",
    filesystem = {
        filtered_items = {
            hide_gitignored = true,
            hide_hidden = true,
        },
        follow_current_file = { enabled = true },
    },
    git_status = {
        enable = true,
    },
    window = {
        position = "left",
        auto_expand_width = false,
        hijack_netrw_behavior = "disabled",
        width = 35,      
        mappings = {
            ["<space>"] = "toggle_node",
            ["<2-LeftMouse>"] = "open",
            ["e"] = function() vim.api.nvim_exec("Neotree focus filesystem", true) end,
            ["g"] = function() vim.api.nvim_exec("Neotree focus git_status", true) end,
        },
    },
})

