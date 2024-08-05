{ config, pkgs, lib, inputs, ... }:

let
  cfg = config.myHomeModules.utilities.neovim;
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./mappings.nix
    ./options.nix
  ];
  
  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        # For vimtex
        texliveFull
      ];

      globals = {
        # Disable netrw
        "loaded_netrw" = 1;
        "loaded_netrwPlugin" = 1;
      };
    };
  };
}
