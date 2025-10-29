-- Basic fold UI
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Triangles for folds
vim.opt.fillchars = {
  foldopen = "▼",
  foldclose = "▶",
  foldsep = " ",
}

require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    if filetype == "markdown" then
      return { "treesitter", "indent" }
    end
    return { "lsp", "indent" }
  end,
})

