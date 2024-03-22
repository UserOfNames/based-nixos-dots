require 'nvim-treesitter.configs'.setup({
  ignore_install = { "latex" },

  highlight = {
    enable = true,
    disable = { "latex" },
  },
  
  indent = {
    enable = true,
  },
})
