{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
      "$fileManager" = "lf";
      "$menu" = "rofi --show drun";
      "$browser" = "firefox";

      input = {
        "numlock_by_default" = true;
      };

      bind = [
        "$mainMod, return, exec, $terminal"
        "$mainMod SHIFT, M, exit,"
        "$mainMod, Q, killactive"
        "$mainMod, F, fullscreen"

        "$mainMod, W, exec, $browser"
        "$mainMod, R, exec, $menu"

        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"
      ];
    };
  };
}
