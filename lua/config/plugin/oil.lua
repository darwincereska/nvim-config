require("oil").setup({
    default_file_explorer = true,
    columns = {
        "icon",
    },
    keymaps = {
        ["g."] = { "actions.toggle_hidden", mode = "n"}
    }

})
