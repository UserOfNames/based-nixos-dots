{ config, lib, pkgs, ... }:

let
  cfg = config.myHomeModules.other.style.fonts;

  fontType = lib.types.submodule {
    options = {
      package = lib.mkOption {
        type = lib.types.package;
        description = "The package providing the font";
      };

      name = lib.mkOption {
        type = lib.types.str;
        description = "The internal Fontconfig family name";
      };
    };
  };
in {
  options.myHomeModules.other.style.fonts = {
    serif = lib.mkOption {
      type = fontType;
      default = {
        package = pkgs.source-serif;
        name = "Source Serif 4";
      };
    };

    sansSerif = lib.mkOption {
      type = fontType;
      default = {
        package = pkgs.inter;
        name = "Inter";
      };
    };

    monospace = lib.mkOption {
      type = fontType;
      default = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
    };

    icons = lib.mkOption {
      type = fontType;
      default = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      cfg.serif.package
      cfg.sansSerif.package
      cfg.monospace.package
      cfg.icons.package

      # Fallbacks for rare characters
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];

    fonts = {
      fontconfig = {
        enable = true;

        defaultFonts = {
          # Use Noto fonts as fallbacks
          serif = [ cfg.serif.name "Noto Serif" ];
          sansSerif = [ cfg.sansSerif.name "Noto Sans" ];
          monospace = [ cfg.monospace.name "Noto Sans Mono" ];
          emoji = [ cfg.serif.name "Noto Color Emoji" ];
        };
      };
    };

    gtk.font = {
      name = cfg.sansSerif.name;
      size = 12;
    };
  };
}
