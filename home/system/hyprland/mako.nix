{ config, lib, ... }:

let
  cfg = config.myHomeModules.system.hyprland;
in {
  config.services.mako = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      default-timeout = 10000;

      font = "monospace 10";

      border-radius = 1;
    };
  };
}
