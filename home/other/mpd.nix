{ config, pkgs, lib, ... }:

{
  options = {
    myHomeModules.mpd.enable = lib.mkEnableOption "Enable mpd module";
  };

  config = lib.mkIf config.myHomeModules.mpd.enable {
    services.mpd = {
      enable = true;
      musicDirectory = "/home/zdbg/Music";
      network.startWhenNeeded = true;

      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My Pipewire output"
        }
      '';
    };
  };
}
