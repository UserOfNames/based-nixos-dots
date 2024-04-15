-- Mappings
vim.keymap.set('n', '<Leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<Leader>fb', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<Leader>fg', require('telescope.builtin').git_files, {})
vim.keymap.set('n', '<Leader>fs', require('telescope.builtin').live_grep)