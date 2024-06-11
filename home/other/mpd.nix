{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.other.mpd;
in {
  config = lib.mkIf cfg.enable {
    services.mpd = {
      enable = true;
      musicDirectory = "/home/${config.myModules.system.user.userName}/Music";
      network.startWhenNeeded = true;
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My Pipewire output"
        }
      '';
    };

    services.mpd-mpris.enable = true;
  };
}
