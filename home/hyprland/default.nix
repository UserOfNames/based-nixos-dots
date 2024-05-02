{ config, pkgs, ... }:

{
  imports = [
    ./binds.nix
  ];

  xdg.configFile."hypr/hyprlock.conf".source = ./hyprlock.conf;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
      "$fileManager" = "lf";
      "$menu" = "rofi --show drun";
      "$browser" = "firefox";

      general = {
        "border_size" = 2;
        "gaps_out" = 20;
        "layout" = "master";
      };

      decoration = {
      };

      blur = {
      };

      animations = {
      };

      input = {
        "numlock_by_default" = true;
        "repeat_rate" = 40;
        "repeat_delay" = 300;
        "follow_mouse" = 2;
        touchpad = {
        };
      };

      gestures = {
      };

      group = {
        groupbar = {
        };
      };

      misc = {
        "force_default_wallpaper" = 1;
        "disable_hyprland_logo" = true;
        "disable_autoreload" = true;
        "enable_swallow" = true;
      };
    };
  };
}
