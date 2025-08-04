vim.lsp.config('nixd', {
   settings = {
      nixd = {
         nixpkgs = {
            expr = nixCats.extra('nixdExtras.nixpkgs') or [[import <nixpkgs> {}]]
         },

         formatting = {
            command = { 'alejandra' }
         },
      }
   }
})

vim.lsp.enable('nixd')
