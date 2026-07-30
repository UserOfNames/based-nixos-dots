{ config, lib, ... }:

let
  cfg = config.myHomeModules.system.hyprland;
in {
  config = {
    programs.fuzzel = {
      enable = true;
    };
  };
}
