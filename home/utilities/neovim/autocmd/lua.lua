vim.api.nvim_create_autocmd('FileType', {
   pattern = { "lua" },
   callback = function()
      vim.opt_local.softtabstop = 3
      vim.opt_local.tabstop = 3
      vim.opt_local.shiftwidth = 3
  end
})
