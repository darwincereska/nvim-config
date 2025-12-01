return {
    "darwincereska/notes.nvim",
    config = function()
        require("notes").setup({
            git_remote = "git@github.com:darwincereska/notes.git"           
        })
    end
}
