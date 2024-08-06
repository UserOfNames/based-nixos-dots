{ config, lib, ... }:

let
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
  cfg = config.myHomeModules.system;
in {
  options.myHomeModules.system = {
    enable = mke "Enable 'system' home module group";
    hyprland = {
      enable = mke "Enable hyprland";
      bemenu.enable = mke "Enable bemenu";
      hypridle.enable = mke "Enable hypridle";
      hyprlock.enable = mke "Enable hyprlock";
      mako.enable = mke "Enable mako";
      waybar.enable = mke "Enable waybar";
    };
    zsh.enable = mke "Enable zsh";
  };

  config.myHomeModules.system = {
    hyprland = {
      enable = lmd cfg.enable;
      bemenu.enable = lmd cfg.hyprland.enable;
      hypridle.enable = lmd cfg.hyprland.enable;
      hyprlock.enable = lmd cfg.hyprland.enable;
      mako.enable = lmd cfg.hyprland.enable;
      waybar.enable = lmd cfg.hyprland.enable;
    };
    zsh.enable = lmd cfg.enable;
  };
}
