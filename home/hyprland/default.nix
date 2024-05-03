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
      "$menu" = "bemenu-run";
      "$browser" = "firefox";

      exec-once = [
        "mako"
      ];

      general = {
        "border_size" = 2;
        "gaps_out" = 10;
        "layout" = "master";
      };

      decoration = {
        rounding = 5;
        # active_opacity = 0.95;
        # inactive_opacity = 0.85;
      };

      animations = {
      };

      input = {
        "numlock_by_default" = true;
        "repeat_rate" = 40;
        "repeat_delay" = 300;
        "follow_mouse" = 2;
        touchpad = {
          natural_scroll = false;
        };
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
        "swallow_regex" = "^(Alacritty)$";
      };
    };
  };
}
