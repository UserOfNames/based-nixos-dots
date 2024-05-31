{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.fonts;
in {
  config = lib.mkIf cfg.enable {
    fonts = {
      packages = with pkgs; [
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      ];

      fontDir.enable = true;
      
      fontconfig = {
        defaultFonts = {
          monospace = [ "JetBrainsMono Nerd Font Mono" ];
        };
      };
    };
  };
}
