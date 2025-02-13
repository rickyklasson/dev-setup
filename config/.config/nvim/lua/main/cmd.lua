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
        if not vim.o.diff then
            -- Only orient when in diff mode.
            return
        end

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

-- Accociate .tcss files with CSS filetype
vim.filetype.add({
    extension = {
        tcss = "css",
    },
})

-- Decrease tab width to 2 for C files
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {"*.h", "*.c"},
    callback = function (ev)
        vim.bo.softtabstop = 2
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
    end
})

-- Define highlight for trailing whitespace in NORMAL mode
vim.api.nvim_create_autocmd({"InsertEnter"}, {
    pattern = "*",
    command = "match none"
})

vim.api.nvim_create_autocmd({"InsertLeave"}, {
    pattern = "*",
    command = "match ExtraWhitespace /\\s\\+$/"
})
vim.cmd("highlight ExtraWhitespace ctermbg=red guibg=#ff00ee")
vim.cmd("match ExtraWhitespace /\\s\\+$/")
