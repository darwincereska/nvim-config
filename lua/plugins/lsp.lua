return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "gopls",
                    "clangd",
                    "pyright",
                    "lua_ls",
                    "ts_ls",
                },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { 
            "mason-org/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- Setup each server
            vim.lsp.enable("gopls")
            vim.lsp.enable("clangd")
            vim.lsp.enable("pyright")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("ts_ls")
        end,
    },
}
