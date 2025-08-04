if nixCats('programming.rust') or false then
   local bufnr = vim.api.nvim_get_current_buf()

   vim.keymap.set('n', 'K', function()
      vim.cmd.RustLsp({'hover', 'actions'})
   end, { silent = true, buffer = bufnr, desc = 'Hover actions' })

   vim.keymap.set('n', 'J', function()
      vim.cmd.RustLsp('joinLines')
   end, { silent = true, buffer = bufnr, desc = 'Join lines' })
end
