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
  };
}
