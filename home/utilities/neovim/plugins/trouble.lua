require('trouble').setup({})

vim.keymap.set('n', '<Leader>tt', function() vim.cmd.Trouble('diagnostics toggle') end)
