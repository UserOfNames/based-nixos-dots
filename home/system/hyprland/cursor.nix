{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.system.hyprland.cursor;
in {
  config = lib.mkIf cfg.enable {
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
      size = 16;
    };
  };
}
