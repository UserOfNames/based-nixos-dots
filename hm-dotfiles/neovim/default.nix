{ config, pkgs, lib, ... }:

{

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      base16-nvim
      nvim-treesitter.withAllGrammars
      nvim-tree-lua
      nvim-web-devicons
      vim-nix
      vim-floaterm
      vim-fugitive
      vim-commentary
      vimwiki
      vim-numbertoggle
      vimtex
    ];
  };

  xdg.configFile = {
    "nvim/init.lua".source = ./init.lua;
  };
}
