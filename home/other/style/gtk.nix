{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.other.style.gtk;
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
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
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
    };
  };
}
