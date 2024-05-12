vim.api.nvim_create_autocmd('FileType', {
   pattern = { "nix" },
   callback = function()
      vim.opt_local.softtabstop = 2
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
      -- Set commenstring manually because it won't work automatically for some reason
      vim.opt_local.commentstring = "#%s"
   end
})
