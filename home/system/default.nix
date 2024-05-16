{ config, pkgs, lib, ... }:

let dtrue = lib.mkDefault true; in {
  imports = [
    ./hyprland
    ./waybar
    ./mako.nix
    ./zsh.nix
  ];

  options = {
    myHomeModules.system.enable = lib.mkEnableOption "Enable 'system' home module group";
  };

  config = {
    myHomeModules.system = lib.mkIf config.myHomeModules.system.enable {
      hyprland.enable = dtrue;
      mako.enable = dtrue;
      waybar.enable = dtrue;
      zsh.enable = dtrue;
    };
  };
}
