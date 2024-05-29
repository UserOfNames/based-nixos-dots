{ config, pkgs, lib, ... }:

{
  options = {
    myModules.utilities.thunar.enable = lib.mkEnableOption "Enable thunar module";
  };
  
  config = lib.mkIf config.myModules.utilities.thunar.enable {
    services.gvfs.enable = true;
    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
        tumbler
      ];
    };
  };
}
