return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "markdown",
                "markdown_inline",
                "lua",
                "python",
                "javascript",
                "typescript",
                "html",
                "css",
                "json",
                "yaml",
                "bash",
                "vim",
                "c",
                "cpp",
                "lua",
                "go",
                "kotlin",
                "java"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown", "mdx" },
            },
            indent = {
                enable = true,
            },
        })
    end,
}
