{ config, lib, ... }:

let
  cfg = config.myHomeModules.system.hyprland;

  fontName = config.myHomeModules.other.style.fonts.sansSerif.name;
  fontSize = 10;
in {
  config.services.mako = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      default-timeout = 10000;

      font = "${fontName} ${toString fontSize}";

      border-radius = 1;
    };
  };
}
