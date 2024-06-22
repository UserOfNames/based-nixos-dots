{ config, pkgs, lib, inputs, ... }:

let
  cfg = config.myModules.other.stylix;
in {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      autoEnable = true;

      image = ./Totality.jpg;

      # Slight modifications to align more with nvim-tokyonight-night
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-dark.yaml";
      base16Scheme = {
        base00 = "1A1B26"; # Modified, original 171D23
        base01 = "1D252C";
        base02 = "28323A";
        base03 = "526270";
        base04 = "B7C5D3";
        base05 = "D8E2EC";
        base06 = "F6F6F8";
        base07 = "FBFBFD";
        base08 = "F7768E";
        base09 = "FF9E64";
        base0A = "B7C5D3";
        base0B = "9ECE6A";
        base0C = "73DACA"; # Modified, original 89DDFF
        base0D = "7AA2F7";
        base0E = "BB9AF7";
        base0F = "BB9AF7";
      };

      cursor = {
        package = pkgs.gnome.adwaita-icon-theme;
        name = "Adwaita";
        size = 24;
      };

      fonts = {
        monospace = {
          package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
          name = "JetBrainsMono Nerd Font Mono";
        };

        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };

        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
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
    };
  };
}
