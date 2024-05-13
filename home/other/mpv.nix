{ config, pkgs, lib, ... }:

{
  options = {
    myHomeModules.mpv.enable = lib.mkEnableOption "Enable mpv module";
  };

  config = lib.mkIf config.myHomeModules.mpv.enable {
    programs.mpv = {
      enable = true;
      config = {
        profile = "high-quality";
        force-window = true;
      };
    };
  };
}
