{ config, pkgs, lib, ... }:

{
  options = {
    myModules.system.display.hyprland.enable = lib.mkEnableOption "Enable hyprland";
  };

  config = lib.mkIf config.myModules.system.display.hyprland.enable {
    services.displayManager.defaultSession = "hyprland";

    programs = {
      waybar.enable = true;
      hyprland = {
        enable = true;
        xwayland.enable = true;
      };
    };
  };
}
