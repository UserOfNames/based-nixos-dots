{ config, lib, ...}:

let
  cfg = config.myHomeModules.system.hyprland.mako;
in {
  config = lib.mkIf cfg.enable {
    services.mako = {
      enable = true;

      settings = {
        default-timeout = 10000;
      };
    };
  };
}
