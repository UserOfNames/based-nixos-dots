{ config, lib, ... }:

let
  cfg = config.myHomeModules.utilities.foliate;
in {
  config = lib.mkIf cfg.enable {
    programs.foliate = {
      enable = true;

      settings = {
        color-scheme = 4; # Dark theme

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
