vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cs", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>s0", "/<C-r>0<CR>", { desc = 'Search most recent yank in file' })

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- Yank to system clipboard.
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format document' })
