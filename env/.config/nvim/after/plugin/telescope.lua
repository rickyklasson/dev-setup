local builtin = require('telescope.builtin')

-- Function to clean and sanitize the yanked string
local function sanitized_yank()
  local yank = vim.fn.getreg('"0') -- Get the content of the yank register
  if yank == nil or yank == "" then
    vim.notify("Yank register is empty!", vim.log.levels.ERROR)
    return nil
  end
  yank = yank:gsub("\n", " ")      -- Replace newlines with spaces
  yank = yank:gsub("%s+", " ")     -- Replace multiple spaces with a single space
  yank = yank:match("^%s*(.-)%s*$") -- Trim leading/trailing whitespace
  return yank
end

vim.keymap.set('n', '<leader>sp', builtin.find_files, { desc = 'Telescope find project files' })
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>sl', builtin.live_grep, { desc = "Live grep with empty search field" })
vim.keymap.set('n', '<leader>sy', function()
    local yanked_text = sanitized_yank()
    if yanked_text ~= "" then
        builtin.live_grep({ default_text = yanked_text })
    else
        builtin.live_grep()
    end
end, { desc = "Live grep for yanked text" })

require("telescope").setup({
    defaults = {
        layout_strategy = 'vertical',
        file_ignore_patterns = {
            ".ccsproject",
            ".cproject",
            ".git",
            ".gitattributes",
            ".gitignore",
            ".project",
            ".settings",
            ".vscode",
        },
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
    pickers = {
        find_files = {
            hidden = true,
        }
    }
})
