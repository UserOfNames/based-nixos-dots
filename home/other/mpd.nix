{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.other.mpd;
in {
  config = lib.mkIf cfg.enable {
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
