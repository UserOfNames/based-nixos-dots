{ config, lib, ...}:

let
  cfg = config.myHomeModules.system.hyprland.mako;
in {
  config = lib.mkIf cfg.enable {
    services.mako = {
      enable = true;
      defaultTimeout = 10000;
    };
  };
}
