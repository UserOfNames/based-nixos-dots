{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myHomeModules" "system" ];

  cfg = config.myHomeModules.system;
  lmd = lib.mkDefault;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    myHomeModules.system = {
      hyprland = {
        # enable = lmd cfg.enable;
        bemenu.enable = lmd cfg.hyprland.enable;
        binds.enable = lmd cfg.hyprland.enable;
        hypridle.enable = lmd cfg.hyprland.enable;
        hyprlock.enable = lmd cfg.hyprland.enable;
        mako.enable = lmd cfg.hyprland.enable;
        waybar.enable = lmd cfg.hyprland.enable;
      };

      zsh.enable = lmd cfg.enable;
    };
  };
}
