{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";

      bind = [
        "$mainMod, q, exec, $terminal"
        "$mainMod, M, exit,"
        "$mainMod, R, exec, $menu"
      ];
    };
  };
}
