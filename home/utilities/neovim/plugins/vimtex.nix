{ pkgs, ... }:

{
  programs.nixvim.plugins.vimtex = {
    enable = true;

    texlivePackage = pkgs.texliveFull;

    settings = {
      tex_flavor = "latex";
      tex_conceal = "abdmg";
      conceallevel = 1;
    };
    # NOTE: vimtex advises against lazy loading
  };
}
