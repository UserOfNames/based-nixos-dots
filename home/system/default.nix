{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.system;
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./cursor.nix
    ./hyprland
    ./waybar
    ./mako.nix
    ./zsh.nix
  ];

  config = lib.mkIf cfg.enable {
    myHomeModules.system = {
      hyprland = {
        enable = dtrue;
        hypridle.enable = dtrue;
        hyprlock.enable = dtrue;
      };
      cursor.enable = dtrue;
      mako.enable = dtrue;
      waybar.enable = dtrue;
      zsh.enable = dtrue;
    };
  };
}
