{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.other.style.cursor;
in {
  config = lib.mkIf cfg.enable {
    home.pointerCursor = {
      enable = true;
      gtk.enable = true;
      x11.enable = true;
      hyprcursor.enable = true;

      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      size = 24;
    };
  };
}
