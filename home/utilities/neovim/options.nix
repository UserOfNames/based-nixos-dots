{ ... }:

{
  programs.nixvim = {
    opts = {
      termguicolors = true;
      hidden = true;
      number = true;
      hlsearch = false;
      incsearch = true;
      wrap = false;
      scrolloff = 8;

      # Spaces instead of tabs, default width 4
      expandtab = true;
      softtabstop = 4;
      tabstop = 4;
      shiftwidth = 4;

      # Fold settings - Use treesitter folding, fold nothing by default
      foldenable = false;
      foldlevelstart = 99;
      foldmethod = "expr";
      foldexpr = "nvim_treesitter#foldexpr()";
    };
  };
}
