return {
   'nvim-treesitter',

   event = 'DeferredUIEnter',

   after = function()
      -- vim.opt.runtimepath:prepend(vim.fs.joinpath(vim.fn.stdpath("data"), "site"))
      require('nvim-treesitter.configs').setup({
         -- parser_install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
         auto_install = false,

         highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            disable = {
               'latex',
            },
         },

         indent = {
            enable = true,
         },
      })
   end,
}
