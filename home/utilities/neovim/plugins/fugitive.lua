vim.keymap.set('n', '<Leader>gg', vim.cmd.Git)
vim.keymap.set('n', '<Leader>gb', function() vim.cmd.Git('branch') end)
