return {
    "3rd/image.nvim",
    config = function()
        require("image").setup({
            backend = "kitty",
            processor = "magick_cli",
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = true,
                    download_remote_images = true,
                    only_render_image_at_cursor = true,
                    floating_windows = false,
                    filetypes = { "markdown", "vimwiki"},
                }
            },
            scale_factor = 1.0,
            max_width = nil,
            max_height = nil,
            max_height_window_percentage = 50,
            max_width_window_percentage = nil,
            window_overlap_clear_enabled = false
        })
    end
}
