local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sp', builtin.find_files, { desc = 'Telescope find project files' })
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>sl', builtin.live_grep, { desc = "Live grep with empty search field" })
vim.keymap.set('n', '<leader>sy', function()
    local yanked_text = vim.fn.getreg('"0') -- Get the content of the yank register
    if yanked_text ~= "" then
        builtin.live_grep({ default_text = yanked_text })
    else
        builtin.live_grep()
    end
end, { desc = "Live grep for yanked text" })


require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',       -- Include hidden files
            '--glob=!.git/*', -- Exclude the .git directory
        },
    },
})
