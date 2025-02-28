local harpoon = require('harpoon')

harpoon:setup()

vim.keymap.set("n", "<C-M-a>", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-M-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-M-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-M-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-M-l>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-M-ö>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-M-b>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-M-n>", function() harpoon:list():next() end)
