{ config, pkgs, lib, inputs, ... }:

let
  cfg = config.myModules.other.stylix;
in {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  config = lib.mkIf cfg.enable {
    stylix = {
      base16Scheme = "${pkgs.base16-schemes}/";
      cursor = {
        package = pkgs.gnome.adwaita-icon-theme;
        name = "Adwaita";
      };

      fonts = {
        monospace = {
          package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
          name = "JetBrainsMono Nerd Font Mono";
        };

        sansSerif = {
          package = "";
          name = "";
        };

        serif = {
          package = "";
          name = "";
        };

        sizes = {
          applications = 12;
          terminal = 12;
          desktop = 10;
          popups = 10;
        };
      };

      opacity = {
        applications = 1.0;
        terminal = 1.0;
        desktop = 1.0;
        popups = 1.0;
      };

      polarity = "dark";
    };
  };
}
