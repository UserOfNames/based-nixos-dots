{ config, lib, myLib, ... }:

let
  cfg = config.myHomeModules.system.hyprland;
in {
  config.services.mako = lib.mkIf cfg.enable {
    enable = true;

    settings = with myLib.base16Scheme; {
      default-timeout = 10000;

      background-color = "#${base00}";
      border-color = "#${base0D}";

      font = "monospace 10";

      border-radius = 1;
    };
  };
}
