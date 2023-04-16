{ config, pkgs, lib, ... }:

{
  xdg.configFile = {
    "nvim/init.lua".source = ./init.lua;
   };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-base16
      nvim-tree-lua
      nvim-web-devicons
      vim-nix
      vim-floaterm
      vim-fugitive
      vim-commentary
      vimwiki
      vim-numbertoggle
    ];
  };
}
