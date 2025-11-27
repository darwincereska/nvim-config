return {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            surrounds = {
                ["*"] = {  -- 'b' for bold
                    add = { "**", "**" },
                    find = "%*%*.-%*%*",
                    delete = "^(%*%*)().-(%*%*)()$",
                },
            }
        })
    end
}
