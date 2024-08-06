{ ... }:

{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;

    settings = {
      map_cr = true;
    };
  };
}
