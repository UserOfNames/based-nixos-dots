{ config, pkgs, lib, ... }:

{
  options = {
    module-fonts.enable = lib.mkEnableOption "Enable fonts module";
  };

  config = lib.mkIf config.module-fonts.enable {
    # Add nerdfont hack to fonts, mostly for neovim
    fonts = {
      packages = with pkgs; [
        (nerdfonts.override { fonts = [ "Hack" "JetBrainsMono" ]; })
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
