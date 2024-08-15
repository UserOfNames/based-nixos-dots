{ config, lib, ... }:

let
  cfg = config.myHomeModules.utilities.mpv;
in {
  config = lib.mkIf cfg.enable {
    programs.mpv = {
      enable = true;
      config = {
        profile = "high-quality";
        force-window = true;
        window-maximized = true;
        loop-file = "inf";
      };
    };
  };
}
