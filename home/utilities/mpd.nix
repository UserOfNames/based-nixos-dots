{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.mpd;
in {
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      mpc-cli
      playerctl
    ];

    services.mpd = {
      enable = true;
      musicDirectory = "/home/${config.myModules.system.mainUser.userName}/Music";
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
