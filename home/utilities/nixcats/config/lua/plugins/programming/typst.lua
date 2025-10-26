return {
   'typst-preview.nvim',

   ft = 'typst',

   after = function()
      require('typst-preview').setup({
         dependencies_bin = {
            ['tinymist'] = 'tinymist',
         },
      })
   end,
}
