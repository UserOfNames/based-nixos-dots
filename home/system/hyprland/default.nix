{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.system.hyprland;
in {
  imports = [
    ./binds.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];
  
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mainMod" = "SUPER";
        "$terminal" = "kitty";
        "$fileManager" = "lf";
        "$menu" = "bemenu";
        "$browser" = "firefox";

        exec-once = [
          "hypridle"
          "mako"
          "${pkgs.networkmanagerapplet}/bin/nm-applet --no-agent"
          "${pkgs.swww}/bin/swww-daemon"
          # "${pkgs.swww}/bin/swww img ${../../glowy.jpg}"
          "wl-clip-persist --clipboard regular"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
        ];

        general = {
          "border_size" = 2;
          "gaps_in" = 5;
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
          "swallow_regex" = "^(kitty)$";
        };

        windowrule = [
          "opaque, ^(qimgv)$"
          "opaque, ^(org.pwmt.zathura)$"
        ];

        layerrule = [
          "noanim, ^(menu)$"
        ];
      };
    };
  };
}
