{ config, lib, pkgs, ... }:

let
  cfg = config.myModules.other.style.fonts;

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
  options.myModules.other.style.fonts = {
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
    fonts = {
      # This includes a number of fonts that use the Unicode PUA, which
      # breaks NerdFonts in some cases. Instead, we manually install
      # fallback fonts from Noto only, which leaves the PUA alone.
      enableDefaultPackages = false;

      packages = with pkgs; [
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
  };
}
