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

      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;

      # Hyprcursor-compatible alternative to keep in mind, though I currently
      # prefer Bibata
      # package = pkgs.catppuccin-cursors.mochaLight;
      # name = "catppuccin-mocha-light-cursors";
      # size = 24;
    };
  };
}
