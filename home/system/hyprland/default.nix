{ config, pkgs, lib, ... }:

{
  imports = [
    ./binds.nix
  ];
  
  options  ={
    myHomeModules.system.hyprland.enable = lib.mkEnableOption "Enable hyprland user configuration";
  };

  config = lib.mkIf config.myHomeModules.system.hyprland.enable {
    xdg.configFile = {
      "hypr/hyprlock.conf".source = ./hyprlock.conf;
      "hypr/hypridle.conf".source = ./hypridle.conf;
    };

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mainMod" = "SUPER";
        "$terminal" = "foot";
        "$fileManager" = "lf";
        "$menu" = "fuzzel";
        "$browser" = "firefox";

        exec-once = [
          "hypridle"
          "mako"
          "${pkgs.swww}/bin/swww-daemon"
          # "${pkgs.swww}/bin/swww img ${../../glowy.jpg}"
          "wl-clip-persist --clipboard regular"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
        ];

        general = {
          "border_size" = 2;
          "gaps_out" = 10;
          "layout" = "master";
        };

        decoration = {
          "rounding" = 5;
          "active_opacity" = 0.95;
          "inactive_opacity" = 0.85;
          "blur" = {
            "enabled" = false;
          };
        };

        animations = {
          enabled = true;
          first_launch_animation = false;

          animation = [
            "windows, 1, 7, default"
            "fade, 0"
            "workspaces, 1, 3, default, fade"
          ];
        };

        input = {
          # "numlock_by_default" = true;
          "repeat_rate" = 40;
          "repeat_delay" = 300;
          "follow_mouse" = 2;
          touchpad = {
            "natural_scroll" = false;
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
          "swallow_regex" = "^(foot)$";
        };

        windowrule = [
          "opaque, ^(qimgv)$"
          "opaque, ^(org.pwmt.zathura)$"
        ];
      };
    };
  };
}
