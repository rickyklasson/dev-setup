local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find project files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
-- TODO: This grep search does not seem to work.
vim.keymap.set('n', '<leader>ps', function() 
    builtin.live_grep({
        additional_args = function()
            return { "--hidden", "--glob", "!.git/*" }
        end,
    });
end)

require("telescope").setup()
