{ config, pkgs, lib, ... }:

let
  style = config.myHomeModules.other.style;
  cfg = style.gtk;
in {
  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;

      cursorTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
        size = 24;
      };

      font = {
        name = style.fonts.sansSerif.name;
        size = 12;
      };

      iconTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
      };

      theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3";
      };

      gtk2 = {
        force = true;
      };

      # STATEVERSION FIX: 26.05
      gtk4.theme = config.gtk.theme;
    };
  };
}
