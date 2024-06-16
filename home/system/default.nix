{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.system;
  dtrue = lib.mkDefault true;
  htrue = lib.mkDefault cfg.hyprland.enable;
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
        bemenu.enable = htrue;
        cursor.enable = htrue;
        hypridle.enable = htrue;
        hyprlock.enable = htrue;
        mako.enable = htrue;
        waybar.enable = htrue;
      };
      zsh.enable = dtrue;
    };
  };
}
