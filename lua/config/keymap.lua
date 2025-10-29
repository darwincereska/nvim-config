-- Clear search if in NORMAL mode
vim.keymap.set('n', "<Esc>", "<CMD>noh<CR><Esc>", {  silent = true, desc = "Clear search" })

-- Add Shift+Tab support
vim.keymap.set("n", "<Tab>", ">>", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<<", { silent = true })
vim.keymap.set("v", "<Tab>", ">gv", { silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { silent = true })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { silent = true })

-- File tree keybinds
vim.keymap.set("n", "<D-b>", "<CMD>Neotree toggle<CR>", {  silent = true, desc = "Open file tree" })
vim.keymap.set("n", "<D-S-e>", "<CMD>Neotree focus<CR>", {  silent = true, desc = "Focus on file tree" })

-- Telescope keybinds
vim.keymap.set("n", "<D-p>", "<CMD>Telescope find_files<CR>", {  silent = true, desc = "Open fuzzy finder" })

-- Tabs
vim.keymap.set("n", "<A-Tab>", "<CMD>BufferNext<CR>", {  silent = true, desc = "Cycle to next tab"})
vim.keymap.set("n", "<A-S-Tab>", "<CMD>BufferPrevious<CR>", {  silent = true, desc = "Cycle to previous tab" })
vim.keymap.set("n", "<A-w>", "<CMD>BufferClose<CR>", {  silent = true, desc = "Close tab" })

-- File manager
vim.keymap.set("n", "<D-o>", "<CMD>Oil<CR>", {  silent = true , desc = "Open parent directory" })

-- Comment toggle
vim.keymap.set("n", "<D-/>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", "<D-/>", "gc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("i", "<D-/>", "<C-o>gcc", { remap = true, desc = "Toggle comment" })

-- Small text shortcuts 
vim.keymap.set("i", "<D-Del>", "<C-u>", { desc = "Clear Line" })
vim.keymap.set("i", "<A-BS>", "<C-w>", {  desc = "Delete word backwards" })

-- Terminal
vim.keymap.set({ "n", "i", "v", "t" }, "<D-y>", "<CMD>ToggleTerm<CR>", { remap = true, silent = true, desc = "Toggle terminal" })

