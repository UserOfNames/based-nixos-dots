{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.other.style.theme;
in {
  config = lib.mkIf cfg.enable {
    gtk = {
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
      };

      theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3";
      };

      gtk3 = {
        extraConfig = {
          gtk-application-prefer-dark-theme = 1;
        };
      };

      gtk4 = {
        extraConfig = {
          gtk-application-prefer-dark-theme = 1;
        };
      };
    };

    qt = lib.mkIf config.myHomeModules.system.hyprland.enable {
      platformTheme.name = "gtk3";
      style.name = "adwaita-dark";
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
