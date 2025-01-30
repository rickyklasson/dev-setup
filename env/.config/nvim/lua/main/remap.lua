vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cs", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>s0", "/<C-r>0<CR>", { desc = 'Search most recent yank in file' })

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- Yank to system clipboard.
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format document' })

-- Avoid automatic comment insertion when pressing o/O in NORMAL mode, and enter in INSERT mode.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "setlocal formatoptions-=o formatoptions-=r"
})

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Ensure vimsplits are opened in correct orientation (e.g for diffs)
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function ()
        local width = vim.o.columns
        if width > 200 then
            -- Landscape mode diff: Use vertical split and focus right pane.
            vim.cmd("wincmd H")
            vim.cmd("wincmd l")
        else
            -- Portrait mode diff: Use horizontal split and focus bottom pane.
            vim.cmd("wincmd K")
            vim.cmd("wincmd j")
        end

    end
})
