vim.api.nvim_create_autocmd('FileType', {
   pattern = { "markdown", "vimwiki", "tex" },
   callback = function()
      vim.opt_local.spell = true
   end
})
