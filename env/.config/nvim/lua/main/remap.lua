vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cs", ":nohlsearch<CR>", { silent = true })

-- Yank to system clipboard.
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
