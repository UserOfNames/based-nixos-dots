{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.other.mpv;
in {
  config = lib.mkIf cfg.enable {
    programs.mpv = {
      enable = true;
      config = {
        profile = "high-quality";
        force-window = true;
      };
    };
  };
}
