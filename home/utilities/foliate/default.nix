{ config, lib, ... }:

let
  cfg = config.myHomeModules.utilities.foliate;
  fonts = config.myHomeModules.other.style.fonts;
in {
  config = lib.mkIf cfg.enable {
    programs.foliate = {
      enable = true;

      settings = {
        color-scheme = 4; # Dark theme

        "viewer/font" = {
          default-size = 14;
          serif = fonts.serif.name;
          sans-serif = fonts.sansSerif.name;
          monospace = fonts.monospace.name;
        };

        "viewer/view" = {
          theme = "catppuccin-mocha.json";
        };
      };

      themes = {
        catppuccin-mocha = ./catppuccin-mocha.json;
      };
    };
  };
}
