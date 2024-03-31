require("nvim-tree").setup()

-- Mappings
vim.keymap.set('n', '<Leader>ft', '<Esc>:NvimTreeToggle <Enter>', {silent = true})
