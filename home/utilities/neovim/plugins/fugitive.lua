vim.keymap.set('n', '<Leader>g ', ':Git ')
vim.keymap.set('n', '<Leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<Leader>gb', function() vim.cmd.Git('branch') end)
vim.keymap.set('n', '<Leader>gl', ':Git log ')

vim.keymap.set("n", "<Leader>gdd", "<cmd>Gvdiffsplit!<Enter>")
vim.keymap.set("n", "<Leader>gdh", "<cmd>diffget //2<Enter>")
vim.keymap.set("n", "<Leader>gdl", "<cmd>diffget //3<Enter>")
