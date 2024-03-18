{ config, pkgs, lib, ... }:

{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

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
