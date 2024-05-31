{ config, pkgs, lib, ... }:

let
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

  config = {
    myHomeModules.system = lib.mkIf config.myHomeModules.system.enable {
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
