{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.mpd;
  userName = config.myHomeModules.userName;
in {
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      mpc
      playerctl
    ];

    services.mpd = {
      enable = true;
      musicDirectory = "/home/${userName}/Music";
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
