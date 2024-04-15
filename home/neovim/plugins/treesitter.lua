require 'nvim-treesitter.configs'.setup({
   ignore_install = { "latex" },

   highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = { "latex" },
   },
  
   indent = {
      enable = true,
   },
})
