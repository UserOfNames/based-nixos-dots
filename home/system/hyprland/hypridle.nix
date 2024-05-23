{ config, pkgs, lib, ... }:

{
  options = {
    myHomeModules.system.hyprland.hypridle.enable = lib.mkEnableOption "Enable hypridle module";
  };

  config = lib.mkIf config.myHomeModules.system.hyprland.hypridle.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 300;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
