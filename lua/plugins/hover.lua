return {
    "lewis6991/hover.nvim",
    config = function()
        require("hover").setup {
            init = function()
                require("hover.providers.lsp")
                require('hover.providers.diagnostic')
            end,
            preview_opts = {
                border = 'rounded'
            },
            preview_window = false,
            title = true,
            mouse_providers = {
                'LSP'
            },
            mouse_delay = 1000
        }

        -- Setup the hover on keyboard
        vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
        vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
        
        -- Mouse hover
        vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
        vim.o.mousemoveevent = true
    end
}
