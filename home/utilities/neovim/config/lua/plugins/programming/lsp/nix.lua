vim.lsp.config('nixd', {
   settings = {
      nixd = {
         nixpkgs = {
            expr = [[import <nixpkgs> {}]]
         },

         formatting = {
            command = { 'alejandra' }
         },
      }
   }
})

vim.lsp.enable('nixd')
