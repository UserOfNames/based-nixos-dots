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

      image = ../../assets/Totality.jpg;

      # Slight modifications to align more with nvim-tokyonight-night
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-dark.yaml";
      base16Scheme = {
        base00 = "1a1b26"; # Modified, original 171D23
        base01 = "1d252c";
        base02 = "28323a";
        base03 = "526270";
        base04 = "b7c5d3";
        base05 = "d8e2ec";
        base06 = "f6f6f8";
        base07 = "fbfbfd";
        base08 = "f7768e";
        base09 = "ff9e64";
        base0A = "b7c5d3";
        base0B = "9ece6a";
        base0C = "73daca"; # Modified, original 89DDFF
        base0D = "7aa2f7";
        base0E = "bb9af7";
        base0F = "bb9af7";
      };

      cursor = {
        package = pkgs.adwaita-icon-theme;
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
