{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.system;
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./hyprland
    ./zsh.nix
  ];

  config = lib.mkIf cfg.enable {
    myHomeModules.system = {
      hyprland = {
        enable = dtrue;
        bemenu.enable = cfg.hyprland.enable;
        cursor.enable = cfg.hyprland.enable;
        hypridle.enable = cfg.hyprland.enable;
        hyprlock.enable = cfg.hyprland.enable;
        mako.enable = cfg.hyprland.enable;
        waybar.enable = cfg.hyprland.enable;
      };
      zsh.enable = dtrue;
    };
  };
}
