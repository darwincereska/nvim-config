return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opt = {

    },
    config = function()
        require("toggleterm").setup({
            direction = "float",
            close_on_exit = true,
            shell = "/bin/zsh -l",
            shade_in_terminals = true,
        })
    end,
}
