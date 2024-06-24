vim.keymap.set('n', '<Leader>g ', ':Git ')
vim.keymap.set('n', '<Leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<Leader>gb', function() vim.cmd.Git('branch') end)
vim.keymap.set('n', '<Leader>gl', ':Git log ')
