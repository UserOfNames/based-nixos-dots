{ config, pkgs, lib, ... }:

{
  options = {
    myModules.fonts.enable = lib.mkEnableOption "Enable fonts module";
  };

  config = lib.mkIf config.myModules.fonts.enable {
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
