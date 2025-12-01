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
                    -- "kotlin_language_server",
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
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- Enable mouse support
            vim.o.mouse = 'a'
            vim.o.mousemoveevent = true

            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- LSP keybindings and settings
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    -- Navigation
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<leader>rn', ':IncRename ', opts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                end,
            })

            -- Configure diagnostic display
            vim.diagnostic.config({
                virtual_text = false,
                signs = false,  -- Disable icons in sign column
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = 'rounded',
                    source = 'always',
                    header = '',
                    prefix = '',
                },
            })

            -- Set up line number highlighting for diagnostics (no icons)
            local signs = { Error = "", Warn = "", Hint = "", Info = "" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = "", numhl = hl })
            end

            -- Setup each server using vim.lsp.config (new API in 0.11+)
            local servers = {
                "gopls",
                "clangd",
                "pyright",
                "lua_ls",
                "ts_ls",
                "kotlin_language_server",
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })
                vim.lsp.enable(server)
            end
        end,
    },
}
