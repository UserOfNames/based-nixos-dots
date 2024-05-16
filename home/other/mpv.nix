{ config, pkgs, lib, ... }:

{
  options = {
    myHomeModules.other.mpv.enable = lib.mkEnableOption "Enable mpv module";
  };

  config = lib.mkIf config.myHomeModules.other.mpv.enable {
    programs.mpv = {
      enable = true;
      config = {
        profile = "high-quality";
        force-window = true;
      };
    };
  };
}
