{ config, lib, ... }:

let
  cfg = config.myHomeModules.other.gaming;
in {
  config = lib.mkIf cfg.enable {
    programs.mangohud = {
      enable = true;

      settings = {
        fps_limit = 240;
        no_display = true;
      };
    };
  };
}
