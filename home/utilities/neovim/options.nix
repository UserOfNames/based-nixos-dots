{ ... }:

{
  programs.nixvim = {
    globals = {
      # Disable netrw
      "loaded_netrw" = 1;
      "loaded_netrwPlugin" = 1;
    };

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };

    opts = {
      termguicolors = true;
      hidden = true;
      number = true;
      relativenumber = true;
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
    };
  };
}
